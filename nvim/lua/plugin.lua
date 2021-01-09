-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
require('packer').startup(function()
use {'npxbr/gruvbox.nvim',requires = {"tjdevries/colorbuddy.vim"}}
use 'tendertree/nforcolemak'
use 'mhinz/vim-startify'
use 'kyazdani42/nvim-web-devicons'
use 'hoob3rt/lualine.nvim'
use 'kyazdani42/nvim-tree.lua'
use 'neoclide/coc.nvim'
end)

--load colemak keye mode plugin
require("nforcolemak")
--loap plugin settings 
require("plugin.filetree")
require("plugin.coc")
