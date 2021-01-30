vim.cmd [[packadd packer.nvim]]
require('packer').startup(function() 
   use {'wbthomason/packer.nvim', opt = true}
	--basic
  use 'kyazdani42/nvim-tree.lua'
  use 'tendertree/nforcolemak'
    --snippet
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'rust-lang/vscode-rust'
   --lsp 
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'RishabhRD/popfix'
    use 'RishabhRD/nvim-lsputils'
    use 'tjdevries/lsp_extensions.nvim' 
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
require("plugin.filetree")
