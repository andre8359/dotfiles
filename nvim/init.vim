call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'mindriot101/vim-yapf'
call plug#end()

let g:deoplete#enable_at_startup = 1

"-------------------
"UTF8 compatibilty
"-------------------
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set nocompatible

"-------------------
"indentation
"-------------------
set autoindent
set smartindent

"-------------------
"Tabulation
"-------------------
set tabstop=4
set shiftwidth=4
set expandtab
set textwidth=80

"-------------------
"Nice stuff
"-------------------
set incsearch
set cc=80
syntax enable
set number
set listchars+=space:·
set list
set showmatch
set t_Co=256
set comments=sl:/*,mb:\ *,elx:\ */
set cino=:0,:(0
set path+=** " busca recursiva em subdiretorios
set background=dark
set laststatus=2
set backup
set noundofile
set nobackup " do not keep a backup file (ending in ~)
set noswapfile " do not write a swap file
set hlsearch
set visualbell
set t_vb=
colorscheme elflord
autocmd FileType gitcommit set cc=72
autocmd FileType make,automake set noexpandtab shiftwidth=8 softtabstop=8
highlight ExtraWhitespace ctermbg=blue guibg=blue
match ExtraWhitespace /\s\+\%#\@<!$/


"-------------------
"Python
"-------------------
let g:yapf_style = "pep8"

"-------------------
"Maps
"-------------------
"nmap <F2> :w<CR>
"imap <F2> <ESC>:w<CR>i
map <F7> :NERDTreeToggle<CR>
map <F12> <C-]><CR>
map <C-S-a> :call Yapf(" --style pep8")<CR> 

