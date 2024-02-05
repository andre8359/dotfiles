-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- UTF8 compatibilty
opt.encoding = "utf-8"
opt.fenc = "utf-8"
opt.termencoding = "utf-8"
opt.backspace = "indent,eol,start"

-- indentation
opt.autoindent = true
opt.smartindent = true

-- Tabulation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.textwidth = 120
opt.wrap = false

-- Search
opt.incsearch = true
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true

-- Nice stuff
opt.termguicolors = true
opt.colorcolumn = "120"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"
opt.relativenumber = true
opt.number = true

opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.iskeyword:append("-")
opt.mouse:append("a")
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.guicursor =
    "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
opt.encoding = "UTF-8"
opt.showmode = false
opt.exrc = true
opt.list = true
opt.showmatch = true
opt.cino = ":0,:(0"
opt.path = vim.o.path .. ";**" -- set the path search recursive
opt.autochdir = true --set automaticamente o workdir para o do arquivo aberto
