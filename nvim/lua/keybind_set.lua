local s = vim.api.nvim_set_keymap
--This is my keybind
--colemak 
require("nforcolemak")
--file tree
vim.g.mapleader = 'o'
--lsp key bind set   
s('n','<leader>a','<cmd>lua vim.lsp.buf.code_action() <CR>',{noremap =true})
