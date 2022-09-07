vim.opt.showmode = false

local lualine = require('lualine')

lualine.setup({
  options = {
    theme = 'powerline_dark',
    icons_enabled = true,
    component_separators = '|',
    section_separators = '',
  },
})
