--input

require("nforcolemak-dh")
local s = vim.api.nvim_set_keymap
--Remap space as leader key


vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- base movement
s('n', '<C-1>', ':tabprevious<CR>', { noremap = true, silent = true })
s('n', '<C-2>', ':tabnext<CR>', { noremap = true, silent = true })

--personal setting
s('n', 'x', '"_x', { noremap = true, silent = true })
s('n', '+', '<C-a>', { noremap = true, silent = true })
s('n', '-', '<C-x>', { noremap = true, silent = true })
s('n', 'dw', 'vb"_d', { noremap = true, silent = true })
s('n', '<C-a>', 'gg<S-V>G', { noremap = true, silent = true })
--window
s('n', 'sb', ':split <Return><C-w>w', { silent = true })
s('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })
--s('n', '<F2>', ':below terminal<CR>', { silent = true })
s('n', '<F1>', ':bprevious!<CR>', { noremap = true })
s('n', '<F2>', ':bnext!<CR>', { noremap = true })
s('t', '<C-w>k', '<C-\\><C-n><C-w>k', { noremap = true }) --termial to buffer
s('n', '<leader>w', '<C-w>w', { noremap = true })
s('n', 'gv', ':vsplit<CR>gd', { noremap = true })

--lsp saga
s('n', '<leader>hd', ':Lspsaga hover_doc<CR>', { noremap = true, silent = true })
s('n', '<leader>f', ':Lspsaga lsp_finder<CR>', { noremap = true, silent = true })
s('n', '<leader>sh', ':Lspsaga signature_help<CR>', { noremap = true, silent = true })
s('n', '<leader>pd', ':Lspsaga peek_definition<CR>', { noremap = true, silent = true })
s("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", { silent = true })
s('n', 'gc', ':Lspsaga code_action<CR>', { noremap = true, silent = true })
s('n', 'gr', ':Lspsaga rename<CR>', { noremap = true, silent = true })
s("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
s("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })

--telescope
local actions = require "telescope.actions"
require('telescope').setup {
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			}
		}
	}
}

-- lspsaga
local lspconfig = require 'lspconfig'
local on_attach = function(_, bufnr)
	local opts = { noremap = true, silent = true }
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
-- snippet
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./my-cool-snippets" } })
