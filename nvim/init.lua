--set the alias 
local o = vim.o
local w = vim.wo
local cmd = vim.cmd
local fn = vim.fn 

--basic settings 
o.number = true
o.tabstop = 4
o.autoindent = true
o.smartindent = true 
o.shiftwidth= 4
o.paste = true -- when you paste remove stair
o.termguicolors = true
o.guifont = 'Blexmono Nerd Font'
cmd([[filetype plugin indent on]])
cmd([[syntax on]])

--vim.wo.number = true
--require('mylua')
require('plugin')
--set the color theme 
require("colorbuddy").colorscheme("gruvbox")
require("nforcolemak")
require("filetree")

