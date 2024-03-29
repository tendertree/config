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
		keys = {
			{
				",h", ":Neotree<CR>", silent = true
			}
		}
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
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
		},
		event = 'BufRead',
		keys = {
			{
				"<F6>", ":TodoTelescope<CR>", silent = true
			}
		}
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
		'mfussenegger/nvim-dap',
		config = function()
			require("configs.dap")
		end,
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"mxsdev/nvim-dap-vscode-js",
			-- lazy spec to build "microsoft/vscode-js-debug" from source
			{
				"microsoft/vscode-js-debug",
				version = "1.x",
				build = "npm i && npm run compile vsDebugServerBundle && mv dist out"
			}
		},

		lazy = true,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = function(_, opts)
			opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
				"codelldb",
				"cpptools",
			})
		end,
		enabled = false
	},
	{ 'rcarriga/nvim-notify', event = 'BufEnter' },
	'MunifTanjim/nui.nvim',
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
		end,
		event = 'BufRead',
		lazy = false

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
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup {}
		end,
		dependencies = {
			{
				{
					"folke/zen-mode.nvim",
					config = function()
						require("zen-mode").setup {}
					end
				},
			}
		},
		keys = {
			{ 'T', ":Twilight<CR>", noremap = true, silent = true, }
		}


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
	{
		'nvim-lualine/lualine.nvim',
		config = function()
			require("configs.lualine")
		end
	},
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
		'neovim/nvim-lspconfig',
		event = "VeryLazy",
		dependencies = {
			{
				'mrcjkb/rustaceanvim',
				version = '^4', -- Recommended
				ft = { 'rust' },
				enabled = true,
			},
			{
				"williamboman/mason-lspconfig.nvim",
				config = function()
					require("configs.mason-lspconfig")
				end,
				lazy = false,
				enabled = true,
				dependencies = {
					{
						"williamboman/mason.nvim",
						opts = {
							ensure_installed = { "clang", "lua-language-server", "tsserver", "codelldb" }
						},


					},
				}
			},
		}
	},

	{
		'pmizio/typescript-tools.nvim',
		ft = { 'typescript' },
		opts = {
			settings = {
				tsserver_file_preferences = {
					includeInlayParameterNameHints = 'all',
					includeCompletionsForModuleExports = true,
					quotePreference = 'auto',
				},
				tsserver_format_options = {
					allowIncompleteCompletions = false,
					allowRenameOfImportPath = false,
				},
			},
		},
	},

	{
		"glepnir/lspsaga.nvim",
		event = 'BufRead',
		config = function()
			require("configs.lsp_saga")
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
	{
		'hrsh7th/cmp-nvim-lsp',
		event = 'InsertEnter'
	},
	'hrsh7th/cmp-nvim-lsp-signature-help',
	'hrsh7th/cmp-nvim-lua',
	{
		'saadparwaiz1/cmp_luasnip',
		event = 'InsertEnter'
	},
	{
		'L3MON4D3/LuaSnip',
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("configs.lua_snip")
		end
	}, -- snippetet
	{
		"rafamadriz/friendly-snippets",
		event = 'InsertEnter'
	},
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
	'prisma/vim-prisma',
	{ 'TimUntersberger/neogit', dependencies = 'nvim-lua/plenary.nvim' },
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
