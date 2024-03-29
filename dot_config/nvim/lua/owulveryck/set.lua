vim.opt.guicursor = ""

vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.incsearch = true

vim.opt.smartindent = true
vim.opt.wrap = false
vim.g.mapleader = " "
-- Permanent undo
vim.o.undodir = os.getenv('HOME') .. '/.vimdid'
vim.o.undofile = true

vim.opt.background = "dark"
vim.opt.clipboard = 'unnamedplus'
