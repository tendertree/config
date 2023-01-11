--TODO:정리하기
-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'tpope/vim-fugitive' -- Git commands in nvim
	use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
	use("nathom/filetype.nvim")
	use 'lewis6991/impatient.nvim'
	-- use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
	use 'preservim/tagbar'
	use 'ludovicchabant/vim-gutentags' -- Automatic tags management
	use 'nvim-lua/plenary.nvim'
	use 'sindrets/diffview.nvim'
	use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
	use { 'nvim-telescope/telescope-fzf-native.nvim',
		run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
	use { 'nvim-telescope/telescope-file-browser.nvim' }
	use { "ahmedkhalf/project.nvim" }
	use "lukas-reineke/indent-blankline.nvim"
	use { 'rmagatti/session-lens', requires = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' } }
	use 'nacro90/numb.nvim'
	use 'rhysd/git-messenger.vim'
	-- UI
	use 'terrortylor/nvim-comment'
	use { "tendertree/nforcolemak-dh" }
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'nvim-treesitter/nvim-treesitter-textobjects' --additional text object
	use 'nvim-treesitter/nvim-treesitter-context'
	use { 'RRethy/nvim-treesitter-textsubjects' }
	use 'mfussenegger/nvim-treehopper'
	use 'windwp/nvim-autopairs'
	use 'windwp/nvim-ts-autotag'
	use "akinsho/toggleterm.nvim"
	use { "folke/todo-comments.nvim" }
	use { 'michaelb/sniprun', run = 'bash ./install.sh' }
	use { 'junegunn/fzf', run = ":call fzf#install()" }
	use { 'junegunn/fzf.vim' }
	use { "folke/zen-mode.nvim" }
	use { "folke/twilight.nvim" }
	use { "haringsrob/nvim_context_vt" }
	-- theme
	use "https://codeberg.org/oahlen/iceberg.nvim"
	use 'rktjmp/lush.nvim'
	use { 'ojroques/nvim-hardline' }
	use 'tjdevries/colorbuddy.vim' -- 색상 변경
	use "savq/melange"
	use 'mhinz/vim-startify' -- 시작 화면
	use 'nvim-lualine/lualine.nvim'
	use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }
	use 'romgrk/barbar.nvim' -- tab line
	use { 'anuvyklack/pretty-fold.nvim', config = function() require('pretty-fold').setup {} end }
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'MunifTanjim/prettier.nvim'
	use 'stevearc/dressing.nvim'
	--LSP
	use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
	use { "williamboman/mason.nvim" }
	use { "williamboman/mason-lspconfig.nvim" }
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use 'hrsh7th/nvim-cmp' -- 자동완성
	use 'hrsh7th/cmp-nvim-lsp'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip' -- snippetet
	use "rafamadriz/friendly-snippets"
	use "lukas-reineke/lsp-format.nvim"
	--language setting
	use 'simrat39/rust-tools.nvim'
	-- Debugging
	use 'mfussenegger/nvim-dap'
	use { 'rmagatti/auto-session',
		config = function()
			require("auto-session").setup {
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			}
		end
	}
end)
-- lsp init config
require("todo-comments").setup {}
require 'nvim-tree'.setup {}
require("project_nvim").setup {}
local saga = require("lspsaga")
saga.init_lsp_saga({})
--auto pair

-- some plugin setting
require("todo-comments").setup {}
require 'sniprun'.setup({ display = { "Terminal" }, })
require("indent_blankline").setup { show_current_context = true, show_current_context_start = true, }
require('session-lens').setup({ --[[your custom config--]] })
require("zen-mode").setup {}
require("twilight").setup {}
require('numb').setup()
require("tsht").config.hint_keys = { "h", "j", "f", "d", "n", "v", "s", "l", "a" }
require('neogit').setup { integrations = { diffview = true } }
-- LSP config
require('impatient')
require('telescope').load_extension('fzf', 'file_browser')
require('nvim_comment').setup()
require("plugin.nullls_c")
require("plugin.lsp_c")
require("plugin.lualine_c")
require("plugin.treesitter_c")
require("plugin.nullls_c")
require("plugin.autopairs_c")
require("plugin.autotag_c")
require("plugin.gitsigns_c")
require("plugin.mason_c")
require("plugin.telescope_c")
require("input.snippet")
