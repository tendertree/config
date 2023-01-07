local o = vim.o
local w = vim.wo
local b = vim.bo
local cmd = vim.cmd
local fn = vim.fn
local opt = vim.opt
 
--basic settings 
w.number = true
w.relativenumber = false
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
--
-- use system clipboard
vim.o.clipboard = "unnamedplus"

-- use devaslife setting 
vim.scriptencoding ='utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding ='utf-8'
vim.wo.number =true 
opt.title = ture 
opt.backup = false 
opt.showcmd =true 
opt.cmdheight =1
opt.laststatus =2
opt.expandtab =true
opt.scrolloff =10
opt.shell = 'zsh'
opt.backupskip ='/tmp/*,/private/tmp/*'
opt.inccommnad = 'split'
opt.ignorecase = true
opt.smarttab = true 
opt.breakindent = true 
opt.shiftwidth =2
opt.tabstop =2
opt.ai = true -- Auto indent
opt.si = true -- Smart indent 
opt.wrap = false 
opt.backspace = 'start,eol, indent'
vim.opt.path:append {'**'}
vim.opt.formatoptions:append{'r'}
vim.opt.wildignore:append {'*/node_modules/*'}
vim.api.nvim_create_autocmd('insertLeave',{ pattern = '*',  command = 'set nopaste'})

vim.cmd([[let &t_Cs ="\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

--hightlight
opt.cursorline =true
opt.termguicolors = true 
opt.winblend =0
opt.wildoptions ='pum'
opt.pumblend =5
opt.background ='dark'
