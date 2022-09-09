--input

require("nforcolemak")
local s = vim.api.nvim_set_keymap
--Remap space as leader key


vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--personal setting
s('n', 'x', '"_x', { noremap = true, silent = true })
s('n', '+', '<C-a>', { noremap = true, silent = true })
s('n', '-', '<C-x>', { noremap = true, silent = true })
s('n', 'dw', 'vb"_d', { noremap = true, silent = true })
s('n', '<C-a>', 'gg<S-V>G', { noremap = true, silent = true })
--window
s('n', 'sb', ':split <Return><C-w>w', { silent = true })
s('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })
s('n', '<F5>', ':bprevious!<CR>', { noremap = true })
s('n', '<F6>', ':bnext!<CR>', { noremap = true })
s('t', '<C-w>k', '<C-\\><C-n><C-w>k', { noremap = true }) --termial to buffer
s('n', '<leader>w', '<C-w>w', { noremap = true })

--comment

--lsp saga
s('n', '<leader>hd', ':Lspsaga hover_doc<CR>', { noremap = true, silent = true })
s('n', '<leader>f', ':Lspsaga lsp_finder<CR>', { noremap = true, silent = true })
s('n', '<leader>sh', ':Lspsaga signature_help<CR>', { noremap = true, silent = true })
s('n', '<leader>pd', ':Lspsaga preview_definition<CR>', { noremap = true, silent = true })
s("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", { silent = true })
s('n', 'gc', ':Lspsaga code_action<CR>', { noremap = true, silent = true })
s('n', 'gr', ':Lspsaga rename<CR>', { noremap = true, silent = true })
s("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
s("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })

local action = require("lspsaga.action")
-- scroll in hover doc or  definition preview window
vim.keymap.set("n", "<C-f>", function()
	action.smart_scroll_with_saga(1)
end, { silent = true })
-- scroll in hover doc or  definition preview window
vim.keymap.set("n", "<C-b>", function()
	action.smart_scroll_with_saga(-1)
end, { silent = true })



-- lspsaga
local lspconfig = require 'lspconfig'
local on_attach = function(_, bufnr)
	local opts = { noremap = true, silent = true }
	--vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>g', '<cmd>lua Lspsaga hover_doc<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	--  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl',
		'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	--vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so',
		[[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
	vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- nvim tree
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
--telescope
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tt', ':Telescope file_browser<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>td', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>th', ':Telescope help_tags<CR>', { noremap = true, silent = true })
