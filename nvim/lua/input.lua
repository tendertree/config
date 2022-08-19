

local s = vim.api.nvim_set_keymap
--input
require("nforcolemak")

--Remap space as leader key


vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '



--window
s('n', '<F5>',':bprevious!<CR>',{noremap=true})
s('n', '<F6>',':bnext!<CR>',{noremap=true})
s('t', '<C-w>k','<C-\\><C-n><C-w>k',{noremap=true}) --termial to
--comment
--s('n','dcc','gcc',{noremap=true}) 안먹힘 
--lsp saga 
s('n','<leader>a',':Lspsaga hover_doc<CR>',{noremap=true, silent=true})
s('n', 'gh', ':Lspsaga lsp_finder<CR>', {noremap=true, silent=true})
s('n', 'ca', ':Lspsaga code_action<CR>', {noremap=true, silent=true})
s('n', '<leader>g', ':Lspsaga signature_help<CR>', {noremap=true, silent=true})
s('n', 'gr', ':Lspsaga rename<CR>', {noremap=true, silent=true})
s('n', '<leader>h', ':Lspsaga preview_definition<CR>', {noremap=true, silent=true})
--s('n', 'td',':CommentToggle<CR>', {noremap=true})
--lspsaga
local lspconfig = require 'lspconfig'
local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>g', '<cmd>lua Lspsaga hover_doc<CR>', opts)
  
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end
-- load other key settings
require("input.nvim_tree")
require("input.fuzy")
