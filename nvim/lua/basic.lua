local o = vim.o
local w = vim.wo
local b = vim.bo
local cmd = vim.cmd
local fn = vim.fn
local opt = vim.opt
 
--basic settings 
w.number = true
w.relativenumber = true
o.tabstop = 4
o.autoindent = true
o.smartindent = true 
o.shiftwidth= 4
o.hidden = true 
o.backup = false
o.writebackup = false 
o.cmdheight = 1
o.updatetime=300
o.encoding = "utf-8"
o.shortmess = o.shortmess .. "c"
--for better searching 
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.clipboard ="unnamedplus"
o.grepprg= 'rg \\ --vimgrep\\ --smart-case\\ --follow'
-- auto complete
opt={'menuone', 'noinsert', 'noselect'}  
-- syntax on 
cmd([[filetype plugin indent on]])
cmd([[syntax on]])
cmd([[set mouse=a]])
-- no more use 
--o.mouse = "a"
