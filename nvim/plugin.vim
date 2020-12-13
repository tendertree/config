""
"PlugIn Setting"
""
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
"Plug 'scrooloose/nerdtree'
Plug 'jooize/vim-colemak'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'honza/vim-snippets'
Plug 'puremourning/vimspector' 
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'kristijanhusak/defx-icons' 
Plug 'kristijanhusak/defx-git' 
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
"Plug 'a-vrma/black-nvim', {'do': ':UpdateRemotePlugins'}

call plug#end()
""
"
