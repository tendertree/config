local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
				",h", ":Neotree toggle<CR>", silent = true
			}
		}
	},
	"nvim-neotest/nvim-nio",
	{
		'VonHeikemen/fine-cmdline.nvim',
		dependencies = {
			'MunifTanjim/nui.nvim'
		},
		keys = {
			{ ';', ":lua require'fine-cmdline'.open()<CR>", silent = true, noremap = true }
		},
		event = "InsertEnter"
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
				"<f10>", ":TodoTelescope<CR>", silent = true
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

		},
		keys = {
			{ 'fp', ":lua require'dap'.toggle_breakpoint() <cr>" },
			{ 'fP', ":lua require'dap'.continue() <cr>" }
		},
		lazy = true,
	},
	{
		"microsoft/vscode-js-debug",
		version = "1.x",
		build = "npm i && npm run compile vsDebugServerBundle && mv dist out"
	},

	{
		'rcarriga/nvim-notify',
		event = 'BufEnter'
	},
	'MunifTanjim/nui.nvim',
	'prisma/vim-prisma',
	{
		'nvim-neotest/neotest',
		dependencies = {
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-plenary",
			{
				"folke/neodev.nvim",
				confee = function()
					require("neodev").setup({
						library = { plugins = { "neotest" }, types = true },
					})
				end
			},

		},
		config = function()
			require("configs.neo_test")
		end,
		keys = {
			{ "to", function() require("neotest").run.run(vim.fn.expand("%")) end,                      desc = "Run File" },
			{ "ts", function() require("neotest").summary.toggle() end,                                 desc = "Toggle Summary" },
			{ "tO", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },

		}

	},
	{ 'nvim-neotest/neotest-jest',   ft = "typescript", },
	{ 'marilari88/neotest-vitest',   ft = "typescript", },
	{ "thenbe/neotest-playwright",   ft = "typescript", },
	{ 'rouge8/neotest-rust',         ft = "rust" },
	{ "nvim-neotest/neotest-python", ft = "python" },
	{ "nvim-neotest/neotest-go",     ft = "go" },

	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require("configs.gitsign")
		end

	},
	{
		'TimUntersberger/neogit',
		dependencies = { 'nvim-lua/plenary.nvim', "sindrets/diffview.nvim" },
		config = function()
			require('neogit').setup { integrations = { diffview = true } }
		end,
		keys = {
			{ "<f7>", function() require("neogit").open() end, desc = "Neogit open" },

		}
	},
	"nathom/filetype.nvim",
	{
		'lewis6991/impatient.nvim',
		config = function()
			require('impatient')
		end,
		event = 'BufRead',
		lazy = false,
		enabled = false,

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
		end,
		keys = {
			{ '<leader>tb', ':Telescope buffers<CR>',    noremap = true, silent = true },
			{ '<leader>th', ':Telescope help_tags<CR>',  noremap = true, silent = true },
			{ '<leader>tf', ':Telescope find_files<CR>', noremap = true, silent = true },


		}
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build =
		'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'

	},
	{
		'nvim-telescope/telescope-file-browser.nvim',
		config = function()
			require("configs.telescope_file")
		end,
		dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
		keys = {
			{
				'<f6>',

				function()
					require("telescope").extensions.file_browser.file_browser()
					print("telecope run")
				end,
				noremap = true,
				silent = true
			}
		}

	},
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
			require("configs.autopair")
		end,
		event = 'InsertEnter'
	},
	{
		'windwp/nvim-ts-autotag',
		config = function()
			require("configs.autotag")
		end,
		event = 'InsertEnter'

	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("configs.toggle_term")
		end
	},

	{ 'michaelb/sniprun',         build = 'bash ./install.sh' },
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
			{ 'T', ':lua require("twilight").toggle() <CR>', noremap = true, silent = true, }
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
				lazy = true,
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
		ft = { 'typescript', 'typescriptreact' },
		config = function()
			require("configs.typescript-tool")
		end,
		dependencies = {
			"kyoh86/climbdir.nvim",
		},
		enabled = true,
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
		event = 'InsertEnter',
		pin = "true"
	},
	"lukas-reineke/lsp-format.nvim",
	{
		"SmiteshP/nvim-navbuddy",
		event = 'BufRead',
		dependencies = { "SmiteshP/nvim-navic", "MunifTanjim/nui.nvim" },
		config = function()
			require("configs.navbuddy")
		end,
		opts = { lsp = { auto_attach = true } }

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
	{
		'rmagatti/auto-session',
		config = function()
			require("auto-session").setup {
				logplevel = "error",
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			}
		end
	},
	{
		"cbochs/grapple.nvim",
		opts = {
			scope = "git", -- also try out "git_branch"
		},
		event = { "BufReadPost", "BufNewFile" },
		cmd = "Grapple",
		keys = {
			{ "<leader>gg", "<cmd>Grapple toggle<cr>",          desc = "Grapple toggle tag" },
			{ "<leader>go", "<cmd>Grapple toggle_tags<cr>",     desc = "Grapple open tags window" },
			{ "<leader>ge", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
			{ "<leader>gn", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle next tag" }
		},
	},
	{
		'rust-lang/rust.vim',
		config = function()
			vim.g.rustfmt_autosave = 1
		end,
		ft = { 'rust' },
	},
	{
		'wuelnerdotexe/vim-astro',
		config = function()
			vim.g.astro_stylus = 'enable'
			vim.g.astro_typescript = 'enable'
		end,
		ft = { 'astro' },
		dependencies = {
			"wavded/vim-stylus"
		}
	},
	{
		'lvimuser/lsp-inlayhints.nvim'
	},

}, { defaults = { lazy = true } })
