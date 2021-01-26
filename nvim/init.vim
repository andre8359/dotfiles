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
Plug 'NLKNguyen/papercolor-theme'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'wikitopian/hardmode'
call plug#end()

autocmd FileType gitcommit set cc=72
autocmd FileType cpp  setlocal cc=160
autocmd FileType make,automake set noexpandtab shiftwidth=8 softtabstop=8
highlight ExtraWhitespace ctermbg=blue guibg=blue
match ExtraWhitespace /\s\+\%#\@<!$/

highlight Pmenu ctermbg=gray guibg=gray

let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }

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

"-------------------
"C++
"-------------------
autocmd FileType cpp setlocal commentstring=//\ %s

"-------------------
"Python
"-------------------
let pyhon_highlight_all=1
autocmd FileType python nnoremap <leader>y :call Yapf(" --style pep8")<cr>
let highlight_builtins=1

"--------------------
" Find files using Telescope command-line sugar.
"--------------------
let mapleader = " "
nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>tg <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>

"Hardmode stuff
let g:HardMode_level = 'wannabe'
let g:HardMode_hardmodeMsg = 'Don''t use this!'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
