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
--copy & paste
s('n','y','"*yy',{noremap=true, silent=true})
s('n','p','"*pp',{noremap=true, silent=true})

--lspsaga key binding
s('n','<leader>f',':lua require"lspsaga.provider".lsp_finder()<CR>',{noremap=true, silent=true})
s('n','<leader>a',':lua require"lspsaga.codeaction".code_action()<CR>',{noremap=true, silent=true})
s('v','<leader>a','<,> :lua require"lspsaga.codeaction".range_code_action()<CR>',{noremap=true, silent=true})
s('n','<leader>h',':lua require"lspsaga.hover".render_hover_doc()<CR>',{noremap=true, silent=true})
s('n','<leader>s',':lua require"lspsaga.signaturehelp".signature_help()<CR>',{noremap=true, silent=true})
s('n','<leader>r',':lua require"lspsaga.rename".rename()<CR>',{noremap=true, silent=true})
s('n','<leader>p',':lua require"lspsaga.provider".preview_definition()<CR>',{noremap=true, silent=true})
s('n','[e',':lua require"lspsaga.diagnostic".lsp_jump_diagnostic_prev()<CR>',{noremap=true, silent=true})
s('n',']e',':lua require"lspsaga.diagnostic".lsp_jump_diagnostic_next()<CR>',{noremap=true, silent=true})
s('n','<C-t>',':lua require"lspsaga.floaterm".open_float_terminal()<CR>',{noremap=true, silent=true})
s('t','<C-t>','<C-\\><C-n> :lua require"lspsaga.floaterm".close_float_terminal()<CR>',{noremap=true, silent=true})

--autocomplete
vim.api.nvim_set_keymap('i', '<C-j>', 'pumvisible() ? "<C-n>" : "<Tab>"', {expr = true})
vim.api.nvim_set_keymap('i', '<C-k>', 'pumvisible() ? "<C-p>" : "<Tab>"', {expr = true})
--snippet
--vim.g.UltiSnipsExpandTrigger="<tab>"
vim.g.UltiSnipsJumpForwardTrigger="<C-i>"
vim.g.UltiSnipsJumpBackwardTrigger="<C-h>"
-- make tab smart 

