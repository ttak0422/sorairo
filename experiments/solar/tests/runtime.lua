assert(vim.env.SORAIRO_SOLAR_EXPERIMENT == "1")
local root = assert(vim.env.SORAIRO_SOLAR_ROOT)
local output = assert(vim.env.SORAIRO_SOLAR_OUTPUT)
local source = root .. "/../../colors/sorairo.vim"
package.path = root .. "/lua/?.lua;" .. package.path
local controller = require("controller")
local states = vim.json.decode(table.concat(vim.fn.readfile(output .. "/palettes.json"), "\n"))
local checks, log = 0, {}
local function check(value, label)
  assert(value, label)
  checks = checks + 1
  log[#log + 1] = label
end
local real_set = vim.api.nvim_set_hl
local writes, notifications, color_schemes = 0, 0, 0
vim.api.nvim_create_autocmd("User", {
  pattern = "SorairoPaletteChanged",
  callback = function()
    notifications = notifications + 1
  end,
})
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    color_schemes = color_schemes + 1
  end,
})
local queued, timers, ticks = {}, {}, {}
local function factory()
  local timer = { closed = false, stopped = false }
  function timer:start(first, interval, callback)
    self.first, self.interval, self.callback = first, interval, callback
  end
  function timer:stop()
    self.stopped = true
  end
  function timer:close()
    self.closed = true
  end
  timers[#timers + 1] = timer
  return timer
end
local function schedule(f)
  queued[#queued + 1] = f
end
local function drain()
  local work = queued
  queued = {}
  for _, f in ipairs(work) do
    f()
  end
end
local function tick(event)
  ticks[#ticks + 1] = event
end
vim.o.background = "dark"
vim.cmd("source " .. vim.fn.fnameescape(source))
check(not package.loaded.controller.active, "static colorscheme does not start experiment")
local ansi = {}
for i = 0, 15 do
  ansi[i] = vim.g["terminal_color_" .. i]
end
local c = controller.new({
  timer_factory = factory,
  schedule = schedule,
  set_hl = function(ns, name, attrs)
    writes = writes + 1
    real_set(ns, name, attrs)
  end,
})
c:setup(tick)
drain()
check(#timers == 1 and timers[1].interval == 1800000, "one 30 minute timer")
check(#ticks == 1 and ticks[1] == "start", "startup reevaluates once")
local ok, count = c:apply(states.dark[1])
check(ok and count > 0, "compiled candidate applies")
local n = writes
ok, count = c:apply(states.dark[1])
check(ok and count == 0 and writes == n, "same state writes zero highlights")
check(notifications == 1, "no duplicate palette event on same state")
ok, count = c:apply(states.dark[64])
check(ok and count > 0 and count < vim.tbl_count(states.dark[64].groups), "only changed definitions are written")
check(notifications == 2, "one palette event for changed state")
check(color_schemes == 0, "does not synthesize ColorScheme")
local representative = true
for _, name in ipairs({ "GitSignsAdd", "DiagnosticVirtualTextError", "NotifyWARNIcon", "@lsp.type.comment" }) do
  representative = representative and vim.api.nvim_get_hl(0, { name = name, link = false }).fg ~= nil
end
check(representative, "representative git diagnostic notify and semantic text groups resolve")
local ansi_fixed = true
for i = 0, 15 do
  ansi_fixed = ansi_fixed and vim.g["terminal_color_" .. i] == ansi[i]
end
check(ansi_fixed, "experiment does not rewrite terminal ANSI variables")
local link = vim.api.nvim_get_hl(0, { name = "DiagnosticVirtualTextError", link = true })
check(link.link == "DiagnosticError", "highlight links preserved")
local bad = vim.deepcopy(states.dark[1])
bad.minimum = 4.49
n = writes
check(not c:apply(bad) and writes == n, "reject failed contrast certificate before writes")
local finite = true
for _, minimum in ipairs({ 0 / 0, math.huge }) do
  bad.minimum = minimum
  finite = finite and not c:apply(bad) and writes == n
end
check(finite, "reject non-finite contrast certificate before writes")
bad = vim.deepcopy(states.dark[1])
bad.groups.Normal.bg = 0x1000000
check(not c:apply(bad) and writes == n, "reject invalid RGB before writes")
local custom = vim.api.nvim_create_namespace("SorairoSolarExperimentOtherWindow")
real_set(custom, "Normal", { fg = 0xffffff, bg = 0x000000 })
c:apply(states.dark[2])
check(vim.api.nvim_get_hl(custom, { name = "Normal" }).bg == 0, "does not touch other highlight namespace")
vim.cmd("source " .. vim.fn.fnameescape(source))
vim.api.nvim_exec_autocmds("ColorScheme", {})
drain()
ok, count = c:apply(states.dark[2])
check(
  ok and count > 0 and ticks[#ticks] == "reload",
  "same-theme reload invalidates highlight cache and requests reevaluation"
)
timers[1].callback()
c:setup(tick)
check(timers[1].stopped and timers[1].closed and #timers == 2, "reload closes previous timer")
local before_ticks = #ticks
drain()
check(#ticks == before_ticks + 1, "generation discards queued callback from old setup")
timers[1].callback()
drain()
check(#ticks == before_ticks + 1, "closed timer callback cannot run new generation")
vim.api.nvim_exec_autocmds("FocusGained", {})
vim.api.nvim_exec_autocmds("VimResume", {})
drain()
check(ticks[#ticks - 1] == "FocusGained" and ticks[#ticks] == "VimResume", "focus and resume each request current time")
vim.g.colors_name = "another-theme"
vim.api.nvim_exec_autocmds("ColorScheme", {})
check(not c.enabled and timers[2].closed, "theme switch stops timer")
n = writes
check(not c:apply(states.dark[1]) and writes == n, "old controller does not overwrite other theme")

-- Actual Neovim API with an injected one-shot write failure.
vim.g.colors_name = "sorairo"
local attempts = 0
local failing = controller.new({
  timer_factory = factory,
  schedule = schedule,
  set_hl = function(ns, name, attrs)
    attempts = attempts + 1
    if attempts == 3 then
      error("injected set_hl failure")
    end
    real_set(ns, name, attrs)
  end,
})
failing:setup(tick)
drain()
local saved = {}
for name in pairs(states.dark[1].groups) do
  saved[name] = vim.api.nvim_get_hl(0, { name = name, link = true })
end
local applied, err = failing:apply(states.dark[64])
check(not applied and err.rollback_ok and not failing.enabled, "mid-apply failure stops auto and reports rollback")
local restored = true
for name, attrs in pairs(saved) do
  if not vim.deep_equal(attrs, vim.api.nvim_get_hl(0, { name = name, link = true })) then
    restored = false
  end
end
check(restored, "rollback restores complete prior definitions")
check(timers[#timers].closed, "failure closes timer")

local theme_change = controller.new({
  timer_factory = factory,
  schedule = schedule,
  set_hl = function(ns)
    vim.g.colors_name = "new-theme"
    real_set(ns, "Normal", { fg = 0xff0000, bg = 0x000000 })
    error("theme changed during apply")
  end,
})
vim.g.colors_name = "sorairo"
theme_change:setup(tick)
drain()
check(not theme_change:apply(states.dark[1]), "theme change during failure aborts")
check(vim.api.nvim_get_hl(0, { name = "Normal" }).fg == 0xff0000, "rollback does not restore sorairo over new theme")

-- Inspect all compiled states through a real, isolated Neovim API.
vim.g.colors_name = "sorairo"
local preview = controller.new({ timer_factory = factory, schedule = schedule })
preview:setup(tick)
drain()
local start = vim.uv.hrtime()
for _, mode in ipairs({ "light", "dark" }) do
  vim.o.background = mode
  vim.cmd("source " .. vim.fn.fnameescape(source))
  preview:setup(tick)
  drain()
  for _, state in ipairs(states[mode]) do
    assert(preview:apply(state))
    for name, expected in pairs(state.groups) do
      local actual = vim.api.nvim_get_hl(0, { name = name, link = true })
      for key, value in pairs(expected) do
        assert(vim.deep_equal(actual[key], value), state.id .. " " .. name .. " " .. key)
      end
    end
  end
end
local elapsed = (vim.uv.hrtime() - start) / 1e6
check(true, "every authored definition in 128 states read back from isolated Neovim")
preview:stop()
check(timers[#timers].closed, "explicit teardown closes timer")
vim.g.colors_name = "sorairo"
local actual_timer = controller.new()
actual_timer:setup(function() end)
local handle = actual_timer.timer
local replacement = controller.new()
replacement:setup(function() end)
check(handle:is_closing() and not actual_timer.enabled, "new controller instance closes previous real libuv timer")
local replacement_handle = replacement.timer
vim.api.nvim_exec_autocmds("VimLeavePre", {})
check(replacement_handle:is_closing(), "exit teardown closes actual libuv timer without waiting")

vim.fn.writefile({
  vim.json.encode({
    checks = checks,
    passed = log,
    all_state_apply_readback_ms = elapsed,
    timer_note = "injected lifecycle plus real libuv replacement/exit close checks; no 30-minute wall-clock wait",
  }),
}, output .. "/runtime.json")
print(string.format("%d runtime checks passed; all-state apply/readback %.2f ms", checks, elapsed))
vim.cmd("qa!")
