-- Run only in a dedicated headless instance, never a user's server.
assert(vim.env.SORAIRO_SOLAR_EXPERIMENT == "1")
local root = assert(vim.env.SORAIRO_SOLAR_ROOT)
local output = assert(vim.env.SORAIRO_SOLAR_OUTPUT)
local source = root .. "/../../colors/sorairo.vim"
local names = {}
for line in io.lines(source) do
  local name = line:match("^%s*hi!?%s+([@%w_.]+)")
  if name and name ~= "clear" then
    if name == "link" then
      name = line:match("link%s+([@%w_.]+)")
    end
    names[name] = true
  end
end
local result = {}
for _, mode in ipairs({ "light", "dark" }) do
  vim.o.background = mode
  vim.cmd("source " .. vim.fn.fnameescape(source))
  local groups, resolved, ansi = {}, {}, {}
  for name in pairs(names) do
    groups[name] = vim.api.nvim_get_hl(0, { name = name, link = true })
    resolved[name] = vim.api.nvim_get_hl(0, { name = name, link = false })
  end
  for i = 0, 15 do
    ansi[#ansi + 1] = vim.g["terminal_color_" .. i]
  end
  result[mode] = { groups = groups, resolved = resolved, ansi = ansi }
end
vim.fn.writefile({ vim.json.encode(result) }, output .. "/highlights.json")
vim.cmd("qa!")
