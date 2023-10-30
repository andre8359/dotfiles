return {
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",

    -- Multiline edit
    "mg979/vim-visual-multi",

    -- Detect tabstop and shiftwidth automatically
    "tpope/vim-sleuth",
    {
        -- Add indentation guides even on blank lines
        "lukas-reineke/indent-blankline.nvim",
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help ibl`
        main = "ibl",
        opts = {},
        lazy = false,
    },
}
