source $HOME/.config/nvim/plugin.vim
source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/plugin/nerdtree.vim
source $HOME/.config/nvim/plugin/coc.vim
source $HOME/.config/nvim/plugin/vimspector.vim
"source $HOME/.config/nvim/plugin/ultisnips.vim
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

let g:vimspector_enable_mappings = 'HUMAN'

""
"Short cut 
""
nnoremap <c-n> :call OpenTerminal()<CR>
"nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

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

inoremap <c-j> <c-n>
inoremap <c-k> <c-p>
