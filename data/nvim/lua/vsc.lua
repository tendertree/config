print("Hello World from Neovim! VSC")
local vscode = require('vscode')
-- basic setup
vim.opt.clipboard:append("unnamedplus")
local o = vim.o
local w = vim.wo
local b = vim.bo
local cmd = vim.cmd
local fn = vim.fn
local opt = vim.opt
--basic settings
o.ma = true
o.swapfile = false
o.tabstop = 4
o.shiftwidth = 4
o.hidden = true
o.backup = false
o.writebackup = false
o.cmdheight = 1
o.updatetime = 300
o.fileformat = "unix"
o.fileencoding = "utf-8"
o.encoding = "utf-8"
o.shortmess = o.shortmess .. "c"
--for better searching
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
--folding setting
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- use system clipboard
--astro
vim.g.astro_typescript = 'enable'
vim.g.astro_stylus = 'enable'
--plugin setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	"tendertree/nforcolemak-dh",


})

--input Setting
require("nforcolemak-dh")
local s = vim.api.nvim_set_keymap
---input function settings 
-- local function toggle_sidebar()
-- 	print("run toggle side")
--      vscode.call('workbench.action.toggleSidebarVisibility')
--       vscode.call('workbench.action.focusSideBar')
--     end
local function toggle_sidebar()
  if sidebar_open then
    print("Closing sidebar")
    vscode.call('workbench.action.toggleSidebarVisibility')
    sidebar_open = false
  else
    print("Opening sidebar")
    vscode.call('workbench.action.toggleSidebarVisibility')
    vscode.call('workbench.action.focusSideBar')
    sidebar_open = true
  end
end
--- space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
s('n', 'sh', ':split<Return>', { noremap = true })
s('n', 'sv', ':call VSCodeNotify ("workbench.action.splitEditorRight")<CR>', { noremap = true })
s('n', '<C-w>m', ':call VSCodeNotify ("workbench.action.focusPreviousGroup")<CR>', { noremap = true, silent = true })
s('n', '<C-w>i', ':call VSCodeNotify ("workbench.action.focusNextGroup")<CR>', { noremap = true, silent = true })


s("n", "gc", ":call VSCodeNotify('editor.action.quickFix')<CR>", { noremap = true, silent = true })
s("n", "gr", ":call VSCodeNotify('editor.action.rename')<CR>", { noremap = true, silent = true })

s("n", "<leader>fe", ":call VSCodeNotify('workbench.action.quickOpen')<CR>", { noremap = true, silent = true })
s("n", "<leader>o", ":call VSCodeNotify('workbench.action.showCommands')<CR>", { noremap = true, silent = true })
s('n', '<leader>hv', ":call VSCodeNotify('editor.action.revealDefinitionAside')<CR>", { noremap = true, silent = true })
--s('n', ',h', toggle_sidebar, { noremap = true, silent = true })
vim.keymap.set('n', ',h', toggle_sidebar, { noremap = true, silent = true })

s('n', '<leader>hd', ':Lspsaga hover_doc ++keep<CR>', { noremap = true, silent = true })
s('n', '<leader>f', ':Lspsaga finder<CR>', { noremap = true, silent = true })
s('n', '<leader>sh', ':Lspsaga signature_help<CR>', { noremap = true, silent = true })

--call vsc command 
