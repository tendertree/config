--temp
local s = vim.api.nvim_set_keymap
--s('n', '', 'y', { noremap = true })
--s('v', 'yy', 'oo', { noremap = true })
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
--function
s('n', '<F1>', ':bprevious!<CR>', { noremap = true })
s('n', '<F2>', ':bnext!<CR>', { noremap = true })
s('n', '<F3>', '<Plug>SnipRun', { noremap = true })
s('n', '<F5>', ':Telescope session-lens search_session<CR>', { noremap = true })
s('n', '<f6>', ':todoquickfix<cr>', { noremap = true })
s('n', '<f7>', ':DiffviewOpen<cr>', { noremap = true })
s('n', '<f8>', ':NvimContextVtToggle<cr>', { noremap = true })

--personal setting
s('n', 'x', '"_x', { noremap = true, silent = true })
s('n', '+', '<C-a>', { noremap = true, silent = true })
s('n', '-', '<C-x>', { noremap = true, silent = true })
s('n', 'dw', 'vb"_d', { noremap = true, silent = true })
s('n', '<C-a>', 'gg<S-V>G', { noremap = true, silent = true })
s('n', 'T', ':Twilight<CR>', { noremap = true, silent = true })

vim.cmd [[omap     <silent> H :<C-U>lua require('tsht').nodes()<CR>]]
vim.cmd [[vnoremap <silent> H :lua require('tsht').nodes()<CR>]]

--window
s('n', 'sb', ':split <Return><C-w>w', { silent = true })
s('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })
s('t', '<C-w>k', '<C-\\><C-n><C-w>k', { noremap = true }) --termial to buffer
s('n', '<leader>w', '<C-w>w', { noremap = true })
s('n', 'gv', ':vsplit<CR>gd', { noremap = true })
-- other function

--lsp saga
s('n', '<leader>hd', ':Lspsaga hover_doc<CR>', { noremap = true, silent = true })
s('n', '<leader>f', ':Lspsaga lsp_finder<CR>', { noremap = true, silent = true })
s('n', '<leader>sh', ':Lspsaga signature_help<CR>', { noremap = true, silent = true })
s('n', '<leader>pf', ':Lspsaga peek_definition<CR>', { noremap = true, silent = true })
s("n", "<leader>o", ":Lspsaga outline<CR>", { silent = true })
s('n', 'gc', ':Lspsaga code_action<CR>', { noremap = true, silent = true })
s('n', 'gr', ':Lspsaga rename<CR>', { noremap = true, silent = true })
s("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
s("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
--terminal
require("toggleterm").setup {
	open_mapping = [[<F4>]],
}
local Terminal = require('toggleterm.terminal').Terminal
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
--require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./my-cool-snippets" } })
-- treesitter settings
require 'nvim-treesitter.configs'.setup {
	textobjects = {

		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner"
			}
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				['N'] = '@function.outer',
				[']]'] = '@class.outer'
			},
			goto_previous_start = {
				['E'] = '@function.outer',
				['[['] = '@class.outer'
			}
		}
	}
}
