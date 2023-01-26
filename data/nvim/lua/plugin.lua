--TODO:정리하기

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({

	'lewis6991/gitsigns.nvim',
	'tpope/vim-fugitive', -- Git commands in nvim
	{ 'TimUntersberger/neogit', dependencies = 'nvim-lua/plenary.nvim' },
	"nathom/filetype.nvim",
	'lewis6991/impatient.nvim',
	--  'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
	'preservim/tagbar',
	'ludovicchabant/vim-gutentags', -- Automatic tags management
	'nvim-lua/plenary.nvim',
	'sindrets/diffview.nvim',
	{ 'nvim-telescope/telescope.nvim', dependencies = 'nvim-lua/plenary.nvim' },
	{ 'nvim-telescope/telescope-fzf-native.nvim',
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
	'nvim-telescope/telescope-file-browser.nvim',
	"ahmedkhalf/project.nvim",
	"lukas-reineke/indent-blankline.nvim",
	{ 'rmagatti/session-lens', dependencies = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' } },
	'nacro90/numb.nvim',
	'rhysd/git-messenger.vim',
	{ 'TimUntersberger/neogit', dependencies = 'nvim-lua/plenary.nvim' },
	-- UI
	'terrortylor/nvim-comment',
	"tendertree/nforcolemak-dh",
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	'nvim-treesitter/nvim-treesitter-textobjects', --additional text object
	'nvim-treesitter/nvim-treesitter-context',
	'RRethy/nvim-treesitter-textsubjects',
	'mfussenegger/nvim-treehopper',
	'windwp/nvim-autopairs',
	'windwp/nvim-ts-autotag',
	"akinsho/toggleterm.nvim",
	{ "folke/todo-comments.nvim", config = function() require("todo-comments").setup {} end },
	{ 'michaelb/sniprun', build = 'bash ./install.sh' },
	{ 'junegunn/fzf', build = ":call fzf#install()" },
	{ 'junegunn/fzf.vim' },
	"folke/zen-mode.nvim",
	"folke/twilight.nvim",
	"haringsrob/nvim_context_vt",
	-- theme
	'cocopon/iceberg.vim',
	'savq/melange-nvim',
	'mhinz/vim-startify', -- 시작 화면
	'nvim-lualine/lualine.nvim',
	{ 'kyazdani42/nvim-tree.lua', dependencies = { 'kyazdani42/nvim-web-devicons' } },
	'romgrk/barbar.nvim', -- tab line
	{ 'anuvyklack/pretty-fold.nvim', config = function() require('pretty-fold').setup {} end },
	'jose-elias-alvarez/null-ls.nvim',
	'MunifTanjim/prettier.nvim',
	'stevearc/dressing.nvim',
	--LSP
	'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	"jay-babu/mason-null-ls.nvim",
	{ "glepnir/lspsaga.nvim", event = 'BufRead', config = function() require('lspsaga').setup({}) end, },
	{ 'hrsh7th/nvim-cmp', event = "InsertEnter", dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer" } },
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-vsnip',
	'hrsh7th/cmp-nvim-lsp-signature-help',
	'hrsh7th/cmp-nvim-lua',
	--'hrsh7th/vim-vsnip',
	--'hrsh7th/vim-vsnip-integ',
	--'kitagry/vs-snippets',
	'saadparwaiz1/cmp_luasnip',
	'L3MON4D3/LuaSnip', -- snippetet
	{ "rafamadriz/friendly-snippets", lazy = false },
	"lukas-reineke/lsp-format.nvim",
	--language setting
	'simrat39/rust-tools.nvim',
	-- Debugging
	'mfussenegger/nvim-dap',
	{ 'rmagatti/auto-session',
		config = function()
			require("auto-session").setup {
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			}
		end
	},
	--'simrat39/symbols-outline.nvim',
}, { defaults = { lazy = true } })
-- lsp init config
require("todo-comments").setup {}
require 'nvim-tree'.setup {}
require("project_nvim").setup {}

--auto pair`

-- some plugin setting
--require("symbols-outline").setup()
require 'sniprun'.setup({ display = { "Terminal" }, })
require("indent_blankline").setup { show_current_context = true, show_current_context_start = true, }
require('session-lens').setup({ --[[your custom config--]] })
require("zen-mode").setup {}
require("twilight").setup {}
require('numb').setup()
require("tsht").config.hint_keys = { "h", "j", "f", "d", "n", "v", "s", "l", "a" }
require('neogit').setup { integrations = { diffview = true } }
require("mason-null-ls").setup({ automatic_setup = true, })
-- lsp config
require('impatient')
require('telescope').load_extension('fzf', 'file_browser')
require('nvim_comment').setup()
require("plugin.nullls_c")
require("plugin.lualine_c")
require("plugin.treesitter_c")
require("plugin.nullls_c")
require("plugin.autopairs_c")
require("plugin.autotag_c")
require("plugin.gitsigns_c")
require("plugin.mason_c")
require("plugin.telescope_c")
--require("plugin.v_snip_c")
require("input.snippet")
