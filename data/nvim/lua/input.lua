-- local s = vim.api.nvim_set_keymap
--s('n', '', 'y', { noremap = true })
--temp
--s('v', 'yy', 'oo', { noremap = true })
--input
require("nforcolemak-dh")
local s = vim.api.nvim_set_keymap
local function run() require('neotest').run.run() end

--set some functions
--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- mode change
s('i', 'jl', '<ESC>', { noremap = true, silent = true })
s('t', 'jl', '<C-\\><C-n>', { noremap = true, silent = true })
--paste key problem
s('n', ':', 'p', { noremap = true, silent = true })
s('n', ';', ':', { noremap = true, silent = true })

-- center seach result
s("n", "k", "nzz", { noremap = true, silent = true })
s("n", "K", "Nzz", { noremap = true, silent = true })
--visual line waps
s("v", "<", "<gv", { noremap = true })
s("v", ">", ">gv", { noremap = true })
s("v", "p", "_dp", { noremap = true, silent = true })
-- base movement
s('n', '<C-1>', ':tabprevious<CR>', { noremap = true, silent = true })
s('n', '<C-2>', ':tabnext<CR>', { noremap = true, silent = true })
s('n', '<C-k>', ':m-2<CR>', { noremap = true, silent = true })
s('n', '<C-j>', ':m+1<CR>', { noremap = true, silent = true })
--function
s('n', '<F1>', ':bprevious!<CR>', { noremap = true })
s('n', '<F2>', ':bnext!<CR>', { noremap = true })
s('n', '<F3>', ':Prettier<CR>', { noremap = true })
--f4 is binding to terminal open
s('n', '<F5>', ':undo<CR>', { noremap = true })

--debugger options
--s('n', 'tb', ":lua require'dap'.toggle_breakpoint() <cr>", { noremap = true })
s('n', '<F9>', ":lua require'dap'.step_over() <cr>", { noremap = true })
-- s('n', '<F8>', 'function() require("neotest").run.run(vim.fn.expand("%")) <cr>', { noremap = true })
--screen
s('n', 'sh', ':split<Return>', { noremap = true })
s('n', 'sv', ':vsplit<Return><C-w>w', { noremap = true })
--personal setting
s('n', 'x', '"_x', { noremap = true, silent = true })
s('n', '+', '<C-a>', { noremap = true, silent = true })
s('n', '-', '<C-x>', { noremap = true, silent = true })
s('n', 'dw', 'vb"_d', { noremap = true, silent = true })
s('n', '<C-a>', 'gg<S-V>G', { noremap = true, silent = true })
s('n', 'ss', '"_dd', { noremap = true, silent = true })
vim.cmd [[omap     <silent> H :<C-U>lua require('tsht').nodes()<CR>]]
vim.cmd [[vnoremap <silent> H :lua require('tsht').nodes()<CR>]]


--window
s('t', '<C-w>k', '<C-\\><C-n><C-w>k', { noremap = true }) --termial to buffer
s('n', '<leader>w', '<C-w>w', { noremap = true })
--s('n', 'gv', ':vsplit<CR>gd', { noremap = true })
s("n", "<Left>", ":vertical resize +1<CR>", { noremap = true })
s("n", "<Right>", ":vertical resize -1<CR>", { noremap = true })
--s("n", "<Up>", ":resize -1<CR>", { noremap = true })
--s("n", "<Down>", ":resize +1<CR>", { noremap = true })
--commend lien commendrs
--lsp saga
s('n', '<leader>hv', ':Lspsaga goto_definition<CR>', { noremap = true, silent = true })
s('n', '<leader>hd', ':Lspsaga hover_doc ++keep<CR>', { noremap = true, silent = true })
s('n', '<leader>f', ':Lspsaga finder<CR>', { noremap = true, silent = true })
s('n', '<leader>sh', ':Lspsaga signature_help<CR>', { noremap = true, silent = true })
--s('n', '<leader>zf', ':Lspsaga peek_definition<CR>', { noremap = true, silent = true })
--s("n", "<leader>o", ":Lspsaga outline<CR>", { silent = true })
s("n", "<leader>o", ':Navbuddy<CR>', { noremap = true, silent = true })
s('n', 'gc', ':Lspsaga code_action<CR>', { noremap = true, silent = true })
s('n', 'da', ':Lspsaga code_action<CR>', { noremap = true, silent = true })
s('n', 'gr', ':Lspsaga rename<CR> ', { noremap = true, silent = true })
s("n", "[;", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
s("n", "];", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })


--terminal
require("toggleterm").setup {
	open_mapping = [[<F4>]],
}
local Terminal = require('toggleterm.terminal').Terminal
-- lspsaga
local lspconfig = require 'lspconfig'
local on_attach = function(_, bufnr)
	local opts = { noremap = true, silent = true }
	vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- nvim tree
--telescope
vim.api.nvim_set_keymap('n', '<leader>q', ':RgFzf <CR>', { noremap = true, silent = true })


-- snippet

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
