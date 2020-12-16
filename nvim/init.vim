source $HOME/.config/nvim/plugin.vim
source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/plugin/coc.vim
source $HOME/.config/nvim/plugin/vimspector.vim
source $HOME/.config/nvim/plugin/defx.vim
source $HOME/.config/nvim/plugin/ultisnips.vim
"source $HOME/.config/nvim/plugin/nerdtree.vim
"
"basic Option
"
set encoding=utf8
set splitright " open new split panes to right and below
set splitbelow
set relativenumber
set rnu
set showmatch
"
" Terminal
"
tnoremap <Esc> <C-\><C-n>
au BufEnter * if &buftype == 'terminal' | :startinsert | endif "start terminal in insert mode
function! OpenTerminal() " open terminal on ctrl+n
	split term://bash
	resize 10
endfunction
let g:airline_powerline_fonts = 1
let g:vimspector_enable_mappings = 'HUMAN'
nnoremap <c-n> :call OpenTerminal()<CR>
"
"auto formatter
'
au BufWrite * :Autoformat
"
"FZF //unavailable
"
"nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-s': 'split',
			\ 'ctrl-v': 'vsplit'
			\}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
"
"Highlighting for large files
"
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

"
"change Leader key
"
let mapleader = ","

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"
"insert currend date
"s
iab <expr> dts strftime("%c")

inoremap <c-j> <c-n>
inoremap <c-k> <c-p>

"
"python Setting
"
let g:python3_host_prog = $HOME . '/.local/venv/nvim/bin/python'
autocmd FileType python map <buffer> <F3> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F3> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
"
"rust setting
"
autocmd FileType rust map <buffer> <F3> :RustRun <CR>

"nnoremap <buffer><silent> <c-q> <cmd>call Black()<cr>
"inoremap <buffer><silent> <c-q> <cmd>call Black()<cr>
