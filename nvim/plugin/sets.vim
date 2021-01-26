"-------------------
"UTF8 compatibilty
"-------------------
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set nocompatible
set backspace=indent,eol,start
"-------------------
"indentation
"-------------------
set autoindent
set smartindent

"-------------------
"Tabulation
"-------------------
set tabstop=3
set shiftwidth=3
set expandtab
set textwidth=120

"-------------------
"Helper menus stuff
"-------------------
set cmdheight=2
set updatetime=300
set shortmess+=c

"-------------------
"Nice stuff
"-------------------
set exrc
set nohlsearch
set cc=120
syntax enable
set relativenumber
set number
set list
set showmatch
set t_Co=256
set background=dark
"colorscheme PaperColor
let g:lightline = { 'colorscheme': 'PaperColor' }
set comments=sl:/*,mb:\ *,elx:\ */
set cino=:0,:(0
set path+=** " busca recursiva em subdiretorios
set laststatus=2
set noundofile
set nobackup " do not keep a backup file (ending in ~)
set noswapfile " do not write a swap file
set autochdir " set automaticamente o workdir para o do arquivo aberto
set visualbell
set t_vb=
set belloff=all
set clipboard=unnamedplus
set noerrorbells
set ignorecase
set smartcase
set mouse=a
set hidden
set nowritebackup
set signcolumn=yes
