require('basic_set')
require('plugin')
require('lsp_config')
require('keybind_set')
require('theme_config')
--setting basic
vim.api.nvim_set_keymap('n', 'dt', 'gf', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', 'N',{noremap = true, silent = true})
