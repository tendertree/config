--TODO:정리하기plugin
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
	{
		'nvim-neo-tree/neo-tree.nvim',
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
		opts = {
			filesystem = {
				filtered_items = {
					visible = true,
					show_hidden_count = true,
					hide_dotfiles = false,
					hide_gitignored = true,
					hide_by_name = {
						-- '.git',
						-- '.DS_Store',
						-- 'thumbs.db',
					},
				}
			},
		}
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup {
			}
		end,
	},
	"sindrets/diffview.nvim",
	{
		'Exafunction/codeium.vim',
		event = 'BufEnter',
		config = function()
			-- Change '<C-g>' here to any keycode you like.
			vim.keymap.set('i', '<Right>', function() return vim.fn['codeium#Accept']() end, { expr = true })
		end
	},
	{
		'mfussenegger/nvim-dap'
	},

	{ 'rcarriga/nvim-notify',   event = 'BufEnter' },
	'MunifTanjim/nui.nvim',
	'vim-test/vim-test',
	-- { 'elel-dev/vim-aststro-syntax', ft = "astro" },
	'prisma/vim-prisma',
	{
		'nvim-neotest/neotest',
		event = 'BufRead',
		dependencies = {
			"antoinemadec/FixCursorHold.nvim", 'rouge8/neotest-rust', "nvim-neotest/neotest-python",
			"nvim-neotest/neotest-plenary", "nvim-neotest/neotest-go", "nvim-neotest/neotest-vim-test",
			'vim-test/vim-test', 'marilari88/neotest-vitest' }
	},
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},
	'lewis6991/gitsigns.nvim',
	'tpope/vim-fugitive', -- Git commands in nvim
	{ 'TimUntersberger/neogit', dependencies = 'nvim-lua/plenary.nvim' },
	"nathom/filetype.nvim",
	'lewis6991/impatient.nvim',
	'preservim/tagbar',
	'ludovicchabant/vim-gutentags', -- Automatic tags management
	'nvim-lua/plenary.nvim',
	'sindrets/diffview.nvim',
	{ 'nvim-telescope/telescope.nvim',   dependencies = 'nvim-lua/plenary.nvim' },
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build =
		'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
	},
	'nvim-telescope/telescope-file-browser.nvim',
	"ahmedkhalf/project.nvim",
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = 'BufRead',
		opts = {},
	},
	'nacro90/numb.nvim',
	'rhysd/git-messenger.vim',
	-- UI
	'Shatur/neovim-session-manager',
	'terrortylor/nvim-comment',
	"tendertree/nforcolemak-dh",
	{ 'nvim-treesitter/nvim-treesitter', build = { ':TSUpdate', ':TSInstall markdown markdown_inline' } },
	'nvim-treesitter/nvim-treesitter-textobjects', --additional text object
	'nvim-treesitter/nvim-treesitter-context',
	'vim-pandoc/vim-pandoc-syntax',
	'preservim/vim-markdown',
	'RRethy/nvim-treesitter-textsubjects',
	'mfussenegger/nvim-treehopper',
	'windwp/nvim-autopairs',
	'windwp/nvim-ts-autotag',
	"akinsho/toggleterm.nvim",
	"AmeerTaweel/todo.nvim",
	--{ "folke/todo-comments.nvim", config = function() require("todo-comments").setup {} end },
	{ 'michaelb/sniprun',         build = 'bash ./install.sh' },
	{
		'junegunn/fzf',
		event = 'BufRead',
		build =
		":call fzf#install()"
	},
	{ 'junegunn/fzf.vim',         event = 'BufRead' },
	{ 'wookayin/fzf-ripgrep.vim', event = 'BufRead' },
	"folke/zen-mode.nvim",
	"folke/twilight.nvim",
	"haringsrob/nvim_context_vt",
	'MunifTanjim/prettier.nvim',
	-- theme
	{
		'laytan/tailwind-sorter.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
		build = 'cd formatter && npm i && npm run build',
		config = true,
	},
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require 'alpha'.setup(require 'alpha.themes.startify'.config)
		end
	},
	'cocopon/iceberg.vim',
	'savq/melange-nvim',
	'nvim-lualine/lualine.nvim',
	'romgrk/barbar.nvim', -- tab line
	{
		"cuducos/yaml.nvim",
		ft = { "yaml" }, -- optional
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
		},
	},
	{ 'anuvyklack/pretty-fold.nvim' },
	'jose-elias-alvarez/null-ls.nvim',
	'MunifTanjim/prettier.nvim',
	'stevearc/dressing.nvim',
	--LSP
	{
		'neovim/nvim-lspconfig'
	}, -- Collection of configurations for built-in LSP client
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = { "clang", "lua-language-server", "tsserver", "codelldb" }
		}
	},
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap",
			"williamboman/mason.nvim",
		},
		opts = {
			handlers = {},
			ensure_installed = {
				"codelldb",
			}
		}
	},
	"jay-babu/mason-null-ls.nvim",

	{ "glepnir/lspsaga.nvim", event = 'BufRead',     config = function() require('lspsaga').setup({}) end, },
	{ 'hrsh7th/nvim-cmp',     event = "InsertEnter", dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer" } },
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	{ 'hrsh7th/cmp-nvim-lsp',     event = 'InsertEnter' },
	'hrsh7th/cmp-nvim-lsp-signature-help',
	'hrsh7th/cmp-nvim-lua',
	{ 'saadparwaiz1/cmp_luasnip', event = 'InsertEnter' },
	{
		'L3MON4D3/LuaSnip',
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip/loaders/from_vscode").load()
			require("luasnip/loaders/from_vscode").lazy_load({ paths = "~/.config/nvim/snippets/" })
		end,
	}, -- snippetet
	{ "rafamadriz/friendly-snippets", lazy = false,                          event = 'InsertEnter' },
	"lukas-reineke/lsp-format.nvim",
	{
		"SmiteshP/nvim-navbuddy",
		event = 'BufRead',
		dependencies = { "neovim/nvim-lspconfig", "SmiteshP/nvim-navic", "MunifTanjim/nui.nvim" }
	},
	--language setting
	'simrat39/rust-tools.nvim',
	'prisma/vim-prisma',
	{ 'TimUntersberger/neogit',       dependencies = 'nvim-lua/plenary.nvim' },
	--{ 'Equilibris/nx.nvim',     dependencies = 'nvim-telescope/telescope.nvim' },
	{
		'rmagatti/auto-session',
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
require("project_nvim").setup {}
--auto pair`


-- some plugin setting
--require("symbols-outline").setup()
require 'sniprun'.setup({ display = { "Terminal" }, })
require("zen-mode").setup {}
require("twilight").setup {}
require('numb').setup()
require("tsht").config.hint_keys = { "h", "j", "f", "d", "n", "v", "s", "l", "a" }
require('neogit').setup { integrations = { diffview = true } }
require("todo").setup {}
require("mason-null-ls").setup({ automatic_setup = true, })
require('impatient')
require('telescope').load_extension('fzf', 'file_browser')
require('nvim_comment').setup()
require('pretty-fold').setup()
require('plugin.cmp_c')
require("plugin.neotree_c")
require('plugin.navic_c')
require("plugin.nullls_c")
require("plugin.lualine_c")
require("plugin.treesitter_c")
require("plugin.autopairs_c")
require("plugin.autotag_c")
require("plugin.gitsigns_c")
require("plugin.mason_c")
require("plugin.telescope_c")
require("plugin.lua_snip_c")
require("plugin.neo_test_c")
require("plugin.which_c")
require("plugin.prettier_c")
require("plugin.comment_c")
require("plugin.fzf_c")
require("plugin.lsp_saga_c")
require("plugin.tailwind_sorter_c")
require("plugin.indent_blackline_c")
require("plugin.noice_c")
require("plugin.toggle_term_c")
require("plugin.alpha_c")
require("plugin.navbuddy_c")
