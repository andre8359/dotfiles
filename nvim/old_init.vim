call plug#begin('~/.vim/bundle')
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'rhysd/vim-clang-format'
Plug 'terryma/vim-multiple-cursors'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'ap/vim-buftabline'
Plug 'vim-airline/vim-airline'
Plug 'mindriot101/vim-yapf'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'voldikss/vim-floaterm'
Plug 'wikitopian/hardmode'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'morhetz/gruvbox'
Plug 'rust-lang/rust.vim'
call plug#end()

autocmd FileType gitcommit set cc=72
autocmd FileType cpp  setlocal cc=160
autocmd FileType make,automake set noexpandtab shiftwidth=8 softtabstop=8
highlight ExtraWhitespace ctermbg=blue guibg=blue
match ExtraWhitespace /\s\+\%#\@<!$/

highlight Pmenu ctermbg=gray guibg=gray

let g:NERDTreeMouseMode=3


"-------------------
"Maps
"-------------------
nnoremap <F6> :TagbarToggle<CR>
nnoremap <F7> :NERDTreeToggle<CR>
nnoremap <leader>f :ClangFormat<CR>
nnoremap <C-c> "+y
nnoremap <C-M> :bnext<CR>
nnoremap <C-K> :bprev<CR>
nnoremap <leader>q :bdelete<CR>
nnoremap <silent> <leader>t :FloatermToggle<CR>
tnoremap <silent> <leader>t <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> <leader>nt :FloatermNew --height=0.6 --width=0.9 <CR>
tnoremap <silent> <leader>n <C-\><C-n>:FloatermNext<CR>
tnoremap <silent> <leader>p <C-\><C-n>:FloatermPrev<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap n nzzzv
nnoremap N Nzzzv

"-------------------
"C++
"-------------------
autocmd FileType cpp setlocal commentstring=//\ %s

"-------------------
"Python
"-------------------
let pyhon_highlight_all=1
let g:python3_host_prog='/home/andre/env/bin/python3'
autocmd FileType python nnoremap <leader>y :call Yapf(" --style pep8")<cr>
let highlight_builtins=1
"Hardmode stuff
let g:HardMode_level = 'wannabe'
let g:HardMode_hardmodeMsg = 'Don''t use this!'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
