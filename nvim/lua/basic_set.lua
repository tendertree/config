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
o.hidden = true 
o.backup = false
o.writebackup = false 
o.cmdheight = 1
o.updatetime=300
o.encoding = "utf-8"
o.shortmess = o.shortmess .. "c"
cmd([[filetype plugin indent on]])
cmd([[syntax on]])

-- no more use 
--o.mouse = "a"
