-- file dedicated  to miscellaneous keybinds
local mapkey = require("utils").mapkey

-- Directory Navigation
mapkey("<leader>w", "NvimTreeFocus")
mapkey("<leader>e", "NvimTreeToggle")

-- Moviment
mapkey("<leader>[", "bprevious")
mapkey("<leader>]", "bnext")

mapkey("J", ":m '>+1<CR>gv=gv", "v")
mapkey("K", ":m '<-2<CR>gv=gv", "v")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
