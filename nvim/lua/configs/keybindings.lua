-- file dedicated  to miscellaneous keybinds
local mapkey = require("utils").mapkey

local opts = { noremap = true, silent = true }

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

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- greatest remap ever: past without losing the buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland copy to the clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- debug
vim.keymap.set("n", "<F5>", function()
    require("dap").continue()
end)

vim.keymap.set("n", "<F10>", function()
    require("dap").step_over()
end)

vim.keymap.set("n", "<F11>", function()
    require("dap").step_into()
end)

vim.keymap.set("n", "<F12>", function()
    require("dap").step_out()
end)

vim.keymap.set("n", "<Leader>b", function()
    require("dap").toggle_breakpoint()
end)

vim.keymap.set("n", "<Leader>B", function()
    require("dap").set_breakpoint()
end)

vim.keymap.set("n", "<Leader>lp", function()
    require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)

vim.keymap.set("n", "<Leader>dr", function()
    require("dap").repl.open()
end)

vim.keymap.set("n", "<Leader>dl", function()
    require("dap").run_last()
end)

vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
    require("dap.ui.widgets").hover()
end)

vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
    require("dap.ui.widgets").preview()
end)

vim.keymap.set("n", "<Leader>df", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.frames)
end)

vim.keymap.set("n", "<Leader>ds", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
end)

vim.keymap.set("n", "<leader>dm", function()
    require("neotest").run.run()
end)

vim.keymap.set("n", "<leader>dM", function()
    require("neotest").run.run({ strategy = "dap" })
end)

vim.keymap.set("n", "<leader>df", function()
    require("neotest").run.run({ vim.fn.expand("%") })
end)

vim.keymap.set("n", "<leader>dF", function()
    require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
end)

vim.keymap.set("n", "<leader>dS", function()
    require("neotest").summary.toggle()
end)
