require 'nvim-treesitter.configs'.setup {
	ensure_installed = { "rust", "go", "html", "javascript", "typescript", "python", "tsx", "markdown", "json" },
	sync_install = false,
	incremental_selection = { enable = true, },
	highlight = { enable = true, additional_vim_regex_highlighting = false },
	autotag = { enable = true, },
	indent = { enable = true, disable = {}, }
}
require 'treesitter-context'.setup { enable = true }

require('nvim-treesitter.configs').setup {
	textsubjects = {
		enable = true,
		prev_selection = ',', -- (Optional) keymap to select the previous selection
		keymaps = {
			['.'] = 'textsubjects-smart',
			[';'] = 'textsubjects-container-outer',
			['i;'] = 'textsubjects-container-inner',
		},
	},
}



-- folding setup
local vim = vim
local opt = vim.opt
local api = vim.api

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

local M = {}
function M.nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		api.nvim_command('augroup ' .. group_name)
		api.nvim_command('autocmd!')
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten { 'autocmd', def }, ' ')
			api.nvim_command(command)
		end
		api.nvim_command('augroup END')
	end
end

local autoCommands = {
	-- other autocommands
	open_folds = {
		{ "BufReadPost,FileReadPost", "*", "normal zR" }
	}
}

M.nvim_create_augroups(autoCommands)
