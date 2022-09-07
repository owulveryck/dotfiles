local nnoremap = require("owulveryck.keymap").nnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>ff", "<cmd>lua vim.lsp.buf.formatting()<CR>")

