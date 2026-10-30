assert(vim.env.SORAIRO_SOLAR_EXPERIMENT == nil)
vim.opt.runtimepath:prepend(assert(vim.env.SORAIRO_SOLAR_ROOT) .. "/../..")
for _, mode in ipairs({ "light", "dark" }) do
  vim.o.background = mode
  vim.cmd("colorscheme sorairo")
  local expected = mode == "light" and 0xfdfdff or 0x222b40
  assert(vim.api.nvim_get_hl(0, { name = "Normal" }).bg == expected)
  assert(not package.loaded.controller)
end
vim.cmd("qa!")
