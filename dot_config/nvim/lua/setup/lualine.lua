vim.opt.showmode = false

local lualine = require('lualine')

lualine.setup({
  options = {
    theme = 'tokyonight',
    icons_enabled = true,
    component_separators = '|',
    section_separators = '',
  },
})
