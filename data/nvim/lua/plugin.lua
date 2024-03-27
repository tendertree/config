local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
	{
		'nvim-neo-tree/neo-tree.nvim',
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },

		config = function()
			require("configs.neotree")
		end,
		lazy = false
	},
	"nvim-neotest/nvim-nio",
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("configs.noice")
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

	{ 'rcarriga/nvim-notify', event = 'BufEnter' },
	'MunifTanjim/nui.nvim',
	'vim-test/vim-test',
	'prisma/vim-prisma',
	{
		'nvim-neotest/neotest',
		event = 'BufRead',
		dependencies = {
			"antoinemadec/FixCursorHold.nvim", 'rouge8/neotest-rust', "nvim-neotest/neotest-python",
			"nvim-neotest/neotest-plenary", "nvim-neotest/neotest-go", "nvim-neotest/neotest-vim-test",
			'vim-test/vim-test', 'marilari88/neotest-vitest' },
		config = function()
			--require("configs.neo_test")
		end
	},

	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require("configs.gitsign")
		end

	},
	'tpope/vim-fugitive', -- Git commands in nvim
	{
		'TimUntersberger/neogit',
		dependencies = 'nvim-lua/plenary.nvim',
		config = function()
			require('neogit').setup { integrations = { diffview = true } }
		end
	},
	"nathom/filetype.nvim",
	{
		'lewis6991/impatient.nvim',
		config = function()
			require('impatient')
		end

	},
	'preservim/tagbar',
	'ludovicchabant/vim-gutentags', -- Automatic tags management
	'nvim-lua/plenary.nvim',
	'sindrets/diffview.nvim',
	{
		'nvim-telescope/telescope.nvim',
		dependencies = 'nvim-lua/plenary.nvim',
		config = function()
			require("configs.telescope")
		end


	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build =
		'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'

	},
	'nvim-telescope/telescope-file-browser.nvim',
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup {}
		end
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = 'BufRead',
		opts = {},
		config = function()
			require("configs.indent_blackline")
		end
	},
	{
		'nacro90/numb.nvim',
		config = function()
			require('numb').setup()
		end
	},
	'rhysd/git-messenger.vim',
	-- UI
	'Shatur/neovim-session-manager',
	{
		'numToStr/Comment.nvim',
		config = function()
			require("configs.comment")
		end,
		lazy = false,
	},
	"tendertree/nforcolemak-dh",
	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require("configs.treesitter")
		end,
		build = { ':TSUpdate', ':TSInstall markdown markdown_inline' }
	},
	'nvim-treesitter/nvim-treesitter-textobjects', --additional text object
	'nvim-treesitter/nvim-treesitter-context',
	'vim-pandoc/vim-pandoc-syntax',
	'preservim/vim-markdown',
	'RRethy/nvim-treesitter-textsubjects',
	{
		'mfussenegger/nvim-treehopper',
		config = function()
			require("tsht").config.hint_keys = { "h", "j", "f", "d", "n", "v", "s", "l", "a" }
		end

	},
	{
		'windwp/nvim-autopairs',
		config = function()
			require("configs.autopairs")
		end
	},
	{
		'windwp/nvim-ts-autotag',
		config = function()
			require("configs.autotag")
		end

	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("configs.toggle_term")
		end
	},
	{
		"AmeerTaweel/todo.nvim",
		config = function()
			require("todo").setup {}
		end
	},
	{ 'michaelb/sniprun',     build = 'bash ./install.sh' },
	{
		'junegunn/fzf',
		event = 'BufRead',
		build =
		":call fzf#install()",
		config = function()
			require 'sniprun'.setup({ display = { "Terminal" }, })
		end
	},
	{ 'junegunn/fzf.vim',         event = 'BufRead' },
	{ 'wookayin/fzf-ripgrep.vim', event = 'BufRead' },
	{
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup {}
		end


	},
	{
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup {}
		end
	},
	"haringsrob/nvim_context_vt",
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
			require("configs.alpha")
		end,
		lazy = false
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
	{
		'anuvyklack/pretty-fold.nvim',
		config = function()
			require('pretty-fold').setup()
		end

	},

	'stevearc/dressing.nvim',
	--LSP
	{
		'neovim/nvim-lspconfig'
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = { "clang", "lua-language-server", "tsserver", "codelldb" }
		},

	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("configs.mason-lspconfig")
		end,
		lazy = false

	},
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
	{
		"glepnir/lspsaga.nvim",
		event = 'BufRead',
		config = function()
			--require("configs.lsp_saga")
		end,
	},
	{
		'hrsh7th/nvim-cmp',
		event = "InsertEnter",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer" },
		config = function()
			require("configs.cmp")
		end
	},
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
			require("configs.lua_snip")
		end
	}, -- snippetet
	{ "rafamadriz/friendly-snippets", lazy = false,                          event = 'InsertEnter' },
	"lukas-reineke/lsp-format.nvim",
	{
		"SmiteshP/nvim-navbuddy",
		event = 'BufRead',
		dependencies = { "neovim/nvim-lspconfig", "SmiteshP/nvim-navic", "MunifTanjim/nui.nvim" },
		config = function()
			require("configs.navbuddy")
		end

	},
	{
		"SmiteshP/nvim-navic",
		config = function()
			require("configs.navic")
		end
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
	{
		'rust-lang/rust.vim',
		config = function()
			vim.g.rustfmt_autosave = 1
		end
	},
	{
		'lvimuser/lsp-inlayhints.nvim'
	},
}, { defaults = { lazy = true } })


-- some plugin setting
