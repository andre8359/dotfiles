-- The plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("configs.global_sets")
require("configs.keybindings")
require("configs.autocmds")

local options = {
    defaults = {
        lazy = true, -- should plugins be lazy-loaded?
    },
    install = {
        -- try to load one of these colorschemes when starting an installation during startup
        colorscheme = { "dayfox" },
    },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = true,
        notify = false, -- get a notification when changes are found
    },
    performance = {
        reset_packpath = true, -- reset the package path to improve startup time
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
                "netrw",
            },
        },
    },
}

require("lazy").setup("plugins", options)

-- Plug 'majutsushi/tagbar'
-- Plug 'scrooloose/nerdtree'
-- Plug 'jackguo380/vim-lsp-cxx-highlight'
-- Plug 'wikitopian/hardmode'
-- Plug 'morhetz/gruvbox'
