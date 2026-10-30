-- Experimental adapter, explicitly gated to the isolated headless harness.
-- No startup hook, system appearance discovery, sockets or OS integration.
local M = {}

function M.new(opts)
  assert(vim.env.SORAIRO_SOLAR_EXPERIMENT == "1", "explicit experiment opt-in required")
  opts = opts or {}
  local controller = { generation = 0, last = {}, enabled = false, timer = nil }
  local set_hl = opts.set_hl or vim.api.nvim_set_hl
  local get_hl = opts.get_hl or function(name)
    return vim.api.nvim_get_hl(0, { name = name, link = true })
  end
  local schedule = opts.schedule or vim.schedule
  local timer_factory = opts.timer_factory or vim.uv.new_timer

  function controller:stop()
    self.generation = self.generation + 1
    self.enabled = false
    if M.active == self then
      M.active = nil
    end
    if self.timer then
      self.timer:stop()
      self.timer:close()
      self.timer = nil
    end
    if self.augroup then
      vim.api.nvim_del_augroup_by_id(self.augroup)
      self.augroup = nil
    end
  end

  function controller:apply(state)
    if not self.enabled or vim.g.colors_name ~= "sorairo" then
      self:stop()
      return false, "inactive theme"
    end
    if
      type(state) ~= "table"
      or type(state.groups) ~= "table"
      or type(state.minimum) ~= "number"
      or state.minimum ~= state.minimum
      or state.minimum == math.huge
      or state.minimum < 4.5
    then
      return false, "unvalidated palette"
    end
    local names = vim.tbl_keys(state.groups)
    table.sort(names)
    local changes, before = {}, {}
    for _, name in ipairs(names) do
      local attrs = state.groups[name]
      for _, key in ipairs({ "fg", "bg", "sp" }) do
        local value = attrs[key]
        if
          value ~= nil
          and (type(value) ~= "number" or value ~= value or value < 0 or value > 0xffffff or value % 1 ~= 0)
        then
          return false, "invalid colour"
        end
      end
      if not vim.deep_equal(self.last[name], attrs) then
        changes[#changes + 1] = name
        before[name] = get_hl(name)
      end
    end
    if #changes == 0 then
      return true, 0
    end
    local ok, err = pcall(function()
      for _, name in ipairs(changes) do
        set_hl(0, name, state.groups[name])
      end
    end)
    if not ok then
      local restored = true
      local skipped = vim.g.colors_name ~= "sorairo"
      if vim.g.colors_name == "sorairo" then
        for _, name in ipairs(changes) do
          if not pcall(set_hl, 0, name, before[name]) then
            restored = false
          end
        end
      end
      self:stop()
      return false,
        { error = err, rollback_ok = restored and not skipped, rollback_skipped = skipped, theme = vim.g.colors_name }
    end
    self.last = vim.deepcopy(state.groups)
    vim.api.nvim_exec_autocmds("User", { pattern = "SorairoPaletteChanged", modeline = false })
    return true, #changes
  end

  function controller:setup(tick)
    if M.active and M.active ~= self then
      M.active:stop()
    end
    self:stop()
    M.active = self
    self.last = {} -- after a real colorscheme reload, cache must be invalidated
    self.enabled = true
    local generation = self.generation
    local function evaluate(event)
      schedule(function()
        if self.generation == generation and self.enabled then
          if vim.g.colors_name == "sorairo" then
            tick(event)
          else
            self:stop()
          end
        end
      end)
    end
    self.timer = assert(timer_factory())
    self.timer:start(1800000, 1800000, function()
      evaluate("timer")
    end)
    self.augroup = vim.api.nvim_create_augroup("SorairoSolarExperimentLifecycle", { clear = true })
    vim.api.nvim_create_autocmd({ "FocusGained", "VimResume" }, {
      group = self.augroup,
      callback = function(args)
        evaluate(args.event)
      end,
    })
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = self.augroup,
      callback = function()
        if vim.g.colors_name ~= "sorairo" then
          self:stop()
        else
          self.last = {}
          evaluate("reload")
        end
      end,
    })
    vim.api.nvim_create_autocmd("VimLeavePre", {
      group = self.augroup,
      callback = function()
        self:stop()
      end,
    })
    evaluate("start")
  end
  return controller
end
return M
