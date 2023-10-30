-- Fuzzy Finder (files, lsp, etc)
local mapkey = require("utils").mapkey

local opts = {
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
    },
}

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    lazy = false,
    opts = opts,
    config = function()
        require("telescope").setup({})
    end,
    keys = {
        mapkey("<leader>ff", "Telescope git_files"),
        mapkey("<leader>fs", "Telescope find_files"),
        mapkey("<leader>fg", "Telescope live_grep"),
        mapkey("<leader>fb", "Telescope buffers"),
        mapkey("<leader>fh", "Telescope help_tags"),
        mapkey("<leader>fc", "Telescope current_buffer_fuzzy_find"),
        mapkey("<leader>fk", "Telescope keymaps"),
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- Fuzzy Finder Algorithm which requires local dependencies to be built.
        -- Only load if `make` is available. Make sure you have the system
        -- requirements installed.
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            -- NOTE: If you are having trouble with this installation,
            --       refer to the README for telescope-fzf-native for more instructions.
            build = "make",
            config = function()
                return vim.fn.executable("make") == 1
            end,
        },
    },
}
