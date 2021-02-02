vim.cmd [[packadd packer.nvim]]
require('packer').startup(function() 
use {'wbthomason/packer.nvim', opt = true}
--basic
use 'kyazdani42/nvim-tree.lua'
use 'tendertree/nforcolemak'
--snippet
use 'SirVer/ultisnips'
use 'honza/vim-snippets'
--lsp 
use 'neovim/nvim-lspconfig'
use 'nvim-lua/completion-nvim'
use 'tjdevries/lsp_extensions.nvim' 
use 'glepnir/lspsaga.nvim'
--theme
use 'tjdevries/colorbuddy.vim'
use 'npxbr/gruvbox.nvim'
use 'mhinz/vim-startify'
use 'kyazdani42/nvim-web-devicons'
use 'hoob3rt/lualine.nvim'
--rust
use 'rust-lang/rust.vim'
--etc    
end)

   --load colemak keye mode plugin
require('lsp_extensions')
require('plugin.filetree')
--use 'RishabhRD/nvim-lsputils'
--use 'RishabhRD/nvim-lsputils'
