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
--Locked
-- use 'tpope/vim-fugitive' -- Git commands in nvim
-- use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
--use {'numToStr/Comment.nvim',config = function() require('Comment').setup() end} -- "gc" to comment visual regions/lines

-- use 'ludovicchabant/vim-gutentags' -- Automatic tags management
-- use 'lukas-reineke/indent-blankline.nvim'
--use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
-- use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
-- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
-- UI 
  use 'terrortylor/nvim-comment'
  use 'tendertree/nforcolemak'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/nvim-treesitter-textobjects' --additional text object
  use 'romgrk/nvim-treesitter-context'
  use {"akinsho/toggleterm.nvim"}
  -- theme
  use {'ojroques/nvim-hardline'}
  use 'tjdevries/colorbuddy.vim' -- 색상 변경 
 -- use  { "ellisonleao/gruvbox.nvim" } -- 컬러 테마 
  use {'sainnhe/everforest'}
  use 'mhinz/vim-startify' -- 시작 화면 
  use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }} 
use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
}
  --LSP
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'williamboman/nvim-lsp-installer'
  use { 'tami5/lspsaga.nvim' }
  use 'hrsh7th/nvim-cmp' -- 자동완성 
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' -- snippetet
  use "rafamadriz/friendly-snippets"
end)



require("plugin.lsp")
require("plugin.saga")
require("plugin.term")
require("plugin.lualine")
require("plugin.treesitter")
require('nvim_comment').setup()
