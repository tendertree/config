-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
require('packer').startup(function()
use {'npxbr/gruvbox.nvim', requires = {"tjdevries/colorbuddy.vim"}}
use {'tendertree/nforcolemak'}
use {'mhinz/vim-startify'}
use {'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      local lualine = require('lualine')
      lualine.theme = 'gruvbox'
      lualine.separator = '|'
      lualine.sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location'  },
      }
      lualine.inactive_sections = {
        lualine_a = {  },
        lualine_b = {  },
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {  },
        lualine_z = {   }
      }
      lualine.extensions = { 'fzf' }
      lualine.status()
    end}
use {'kyazdani42/nvim-tree.lua', 
	config = function()
        vim.g.nvim_tree_side = 'right'
	end}

end)
