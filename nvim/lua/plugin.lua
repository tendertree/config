vim.cmd [[packadd packer.nvim]]
require('packer').startup(function() 
use {'wbthomason/packer.nvim', opt = true}
--basic
use 'kyazdani42/nvim-tree.lua'
use 'tendertree/nforcolemak'
--snippet
use 'SirVer/ultisnips'
use 'honza/vim-snippets'
use 'mlaursen/vim-react-snippets'
--trisitter
--use 'nvim-treesitter/nvim-treesitter'
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
use 'rktjmp/lush.nvim'
--rust
use 'rust-lang/rust.vim'
--filesearch    
use 'junegunn/fzf.vim'
use 'preservim/tagbar'
use 'ludovicchabant/vim-gutentags'
end)

require('lsp_extensions')
require('plugin.filetree')

