local opts = {
    ensure_installed = {
        "efm",
        "bashls",
        "pyright",
        "lua_ls",
        "jsonls",
        "clangd",
        "rust_analyzer",
    },

    automatic_installation = true,
}

return {
    "williamboman/mason-lspconfig.nvim",
    opts = opts,
    event = "BufReadPre",
    dependencies = "williamboman/mason.nvim",
}
