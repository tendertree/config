local s = vim.api.nvim_set_keymap
local g = vim.g 
--This is my keybind
--colemak 
require("nforcolemak")
--file tree
s('n', '<C-b>',':NvimTreeToggle<CR>',{noremap=true})
--leaderkey 
vim.g.mapleader = 'o'
--lsp key bind set   

--lspsaga key binding
s('n','<leader>a',':LspSagaHoverDoc <CR>',{noremap=true, silent=true})

--auto complete
--vim.g.UltiSnipsExpandTrigger="<tab>"
vim.g.UltiSnipsJumpForwardTrigger="<C-i>"
vim.g.UltiSnipsJumpBackwardTrigger="<C-h>"
-- make tab smart 

