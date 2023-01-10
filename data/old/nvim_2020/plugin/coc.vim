""
"plugin Setting"
""
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-emmet', 'coc-css', 'coc-html',
			\'coc-json', 'coc-tsserver', 'coc-snippets',
			\'coc-ultisnips', 'coc-rls', 'coc-rust-analyzer', 'coc-jedi']
""
"Basic Setting
""
" TextEdit might fail if hidden is not set.
set hidden
" " Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
""Give more space for displaying messages.set
set cmdheight=2
set updatetime=300
set shortmess+=c
""
"key map
""
"selection confirm key"
inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() :
			\"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"
"scroll descrpition in popup menu
"
nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"


