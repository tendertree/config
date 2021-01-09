-- currently I use nvimtree
local g = vim.g
local s = vim.api.nvim_set_keymap
g.nvim_tree_side = 'right'
g.nvim_tree_ignore ={'.git', 'node_modules', '.cache'}
g.nvim_tree_git_hl = 1 

s('n','<C-n>',':NvimTreeToggle<CR>',{noremap =true})


