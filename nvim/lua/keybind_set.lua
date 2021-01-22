local s = vim.api.nvim_set_keymap
--This is my keybind
--colemak 
require("nforcolemak")
--file tree
s('n', '<C-b>',':NvimTreeToggle<CR>',{noremap=true})
--leaderkey 
vim.g.mapleader = 'o'
--lsp key bind set   
s('n','<leader>a','<cmd>lua vim.lsp.buf.code_action() <CR>',{noremap =true})
