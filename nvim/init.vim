source $HOME/.config/nvim/plugin.vim
source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/plugin/nerdtree.vim
let g:airline_powerline_fonts = 1
set encoding=utf8
" open new split panes to right and below
set splitright
set splitbelow
set relativenumber
set rnu

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
let g:airline_powerline_fonts = 1
""
"Short cut 
""
nnoremap <c-n> :call OpenTerminal()<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <C-d> <C-R>=strftime("%c")<CR>


let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
""
"coc 
""
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
	     \ pumvisible() ? "\<C-n>" :
             \ <SID>check_back_space() ? "\<TAB>" :
             \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
inoremap <silent><expr> <c-space> coc#refresh()
else
inoremap <silent><expr> <c-@> coc#refresh()
endif
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
"insert currend date"
"
iab <expr> dts strftime("%c")
