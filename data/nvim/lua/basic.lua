local o = vim.o
local w = vim.wo
local b = vim.bo
local cmd = vim.cmd
local fn = vim.fn
local opt = vim.opt
--basic settings 좋다
w.number = true
w.relativenumber = false
o.ma = true
o.swapfile = false
o.tabstop = 4
o.autoindent = true
o.smartindent = true
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
o.clipboard = "unnamedplus"
o.grepprg = 'rg \\ --vimgrep\\ --smart-case\\ --follow'
o.termguicolors = true
-- auto complete
opt = { 'menuone', 'noinsert', 'noselect' }
-- syntax on
cmd([[filetype plugin indent on]])
cmd([[syntax on]])
cmd([[set mouse=a]])
--o.mouse = "a"
--folding setting
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- use system clipboard

-- use devaslife setting
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.wo.number = true
opt.title = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 10
opt.shell = 'zsh'
opt.backupskip = '/tmp/*,/private/tmp/*'
opt.inccommnad = 'split'
opt.ignorecase = true
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.ai = true -- Auto indent
opt.si = true -- Smart indent
opt.wrap = false
opt.backspace = 'start,eol, indent'
vim.opt.path:append { '**' }
vim.opt.formatoptions:append { 'r' }
vim.opt.wildignore:append { '*/node_modules/*' }
vim.api.nvim_create_autocmd('insertLeave', { pattern = '*', command = 'set nopaste' })
vim.cmd([[let &t_Cs ="\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

--hightlight
opt.cursorline = true
opt.termguicolors = true
opt.winblend = 0
opt.wildoptions = 'pum'
opt.pumblend = 5
opt.background = 'dark'
--astro
vim.g.astro_typescript = 'enable'
vim.g.astro_stylus = 'enable'
--clibboard
-- vim.opt.clipboard = "unnamedplus"
--
-- vim.g.clipboard = {
--     name = 'win32yank-wsl',
--     copy = { ['+'] = { 'win32yank.exe', '-i', '--crlf' }, ['*'] = { 'win32yank.exe', '-i', '--crlf' } },
--     paste = { ['+'] = { 'win32yank.exe', '-o', '--lf' }, ['*'] = { 'win32yank.exe', '-o', '--lf' } },
--     cache_enabled = false,
-- }
--



_G.__luacache_config = {
	chunks = {
		enable = true,
		path = vim.fn.stdpath('cache') .. '/luacache_chunks',
	},
	modpaths = {
		enable = true,
		path = vim.fn.stdpath('cache') .. '/luacache_modpaths',
	}
}

--turn off auto complete when nerdtree on
vim.api.nvim_create_autocmd("FileType", {
	pattern = "nerdtree",
	callback = function()
		vim.opt_local.completeopt = {}
	end
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.prisma",
	command = "set filetype=prisma",
})
vim.loader.enable()



local M = {}

local augroup = vim.api.nvim_create_augroup("deferClip", {})

local entries = {
  first = 1,
  last = 1,
}
local active_entry = {}

local function add_entry(entry)
  entries[entries.last] = entry
  entries.last = entries.last + 1
end

local function pop_entry()
  if entries.first < entries.last then
    local entry = entries[entries.first]
    entries[entries.first] = nil
    entries.first = entries.first + 1
    return entry
  end
end

local function sync_from()
  vim.fn.jobstart({ "win32yank.exe", "-o", "--lf" }, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      active_entry = { lines = data, regtype = "v" }
    end,
  })
end

local sync_to
do
  local cur_sync_job
  local function sync_next(entry)
    local chan = vim.fn.jobstart({ "win32yank.exe", "-i" }, {
      on_exit = function(_)
        local next_entry = pop_entry()
        if next_entry then
          sync_next(next_entry)
        else
          cur_sync_job = nil
        end
      end,
    })
    cur_sync_job = chan
    vim.fn.chansend(chan, entry.lines)
    vim.fn.chanclose(chan, "stdin")
  end

  sync_to = function()
    if cur_sync_job then
      return
    else
      local entry = pop_entry()
      if entry then
        sync_next(entry)
      end
    end
  end
end

function M.copy(lines, regtype)
  add_entry({ lines = lines, regtype = regtype })
  active_entry = { lines = lines, regtype = regtype }
  sync_to()
end

function M.get_active()
  return { active_entry.lines, active_entry.regtype }
end

function M.setup()
  vim.api.nvim_exec(
    [[
    function s:copy(lines, regtype)
      call luaeval('require("core.vim.deferclip").copy(_A[1], _A[2])', [a:lines, a:regtype])
    endfunction
    function s:get_active()
      call luaeval('require("core.vim.deferclip").get_active()')
    endfunction

    let g:clipboard = {
          \   'name': 'deferClip',
          \   'copy': {
          \      '+': {lines, regtype -> s:copy(lines, regtype)},
          \      '*': {lines, regtype -> s:copy(lines, regtype)},
          \    },
          \   'paste': {
          \      '+': {-> s:get_active()},
          \      '*': {-> s:get_active()},
          \   },
          \ }
  ]],
    false
  )
  vim.api.nvim_create_autocmd({ "FocusGained", "VimEnter" }, {
    group = augroup,
    callback = sync_from,
  })
end

return M
