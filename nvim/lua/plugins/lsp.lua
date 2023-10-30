local mapkey = require("utils").mapkey

local config = function()
    require("neoconf").setup({})

    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local lspconfig = require("lspconfig")

    local diagnostic_signs = { Error = " ", Warn = " ", Hint = "H", Info = "" }

    for type, icon in pairs(diagnostic_signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        mapkey("<leader>gr", "Lspsaga finder", "n", opts) -- go to references
        mapkey("<leader>fd", "Lspsaga peek_definition", "n", opts) -- peak definition
        mapkey("gd", "Lspsaga goto_definition", "n", opts) -- go to definition
        mapkey("<leader>ca", "Lspsaga code_action", "n", opts) -- see available code actions
        mapkey("<leader>rn", "Lspsaga rename", "n", opts) -- smart rename
        mapkey("<leader>D", "Lspsaga show_line_diagnostics", "n", opts) -- show  diagnostics for line
        mapkey("<leader>d", "Lspsaga show_buf_diagnostics", "n", opts) -- show diagnostics for buffer
        mapkey("<leader>n", "Lspsaga diagnostic_jump_prev", "n", opts) -- jump to prev diagnostic in buffer
        mapkey("<leader>m", "Lspsaga diagnostic_jump_next", "n", opts) -- jump to next diagnostic in buffer
        mapkey("K", "Lspsaga hover_doc", "n", opts) -- show documentation for what is under cursor

        if client.name == "pyright" then
            mapkey("<Leader>oi", "PyrightOrganizeImports", "n", opts)
        end
    end

    -- lua
    lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { -- custom settings for lua
            Lua = {
                -- make the language server recognize "vim" global
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    -- make language server aware of runtime files
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
            },
        },
    })

    -- json
    lspconfig.jsonls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "json", "jsonc" },
    })

    -- python
    lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            pyright = {
                disableOrganizeImports = false,
                analysis = {
                    useLibraryCodeForTypes = true,
                    autoSearchPaths = true,
                    diagnosticMode = "workspace",
                    autoImportCompletions = true,
                },
            },
        },
    })

    -- bash
    lspconfig.bashls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "sh", "aliasrc" },
    })

    -- docker
    lspconfig.dockerls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    -- C/C++
    lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = {
            "clangd",
            "--offset-encoding=utf-16",
            "--all-scopes-completion",
            "--background-index",
            "--clang-tidy",
            "--completion-style=detailed",
            "--cross-file-rename",
            "--header-insertion=never",
            "-j=6",
            "--malloc-trim",
            "--pch-storage=memory",
        },
    })

    local luacheck = require("efmls-configs.linters.luacheck")
    local stylua = require("efmls-configs.formatters.stylua")
    local shellcheck = require("efmls-configs.linters.shellcheck")
    local clangformat = require("efmls-configs.formatters.clang_format")
    local mypy = require("efmls-configs.linters.mypy")
    local ruff = require("efmls-configs.formatters.ruff")
    local prettier_d = require("efmls-configs.formatters.prettier_d")
    local fixjson = require("efmls-configs.formatters.fixjson")
    local eslint_d = require("efmls-configs.linters.eslint_d")
    local clang_tidy = require("efmls-configs.linters.clang_tidy")
    local shfmt = require("efmls-configs.formatters.shfmt")
    local hadolint = require("efmls-configs.linters.hadolint")

    -- configure efm server
    lspconfig.efm.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = {
            "lua",
            "python",
            "json",
            "jsonc",
            "sh",
            "markdown",
            "docker",
            "c",
            "cpp",
        },
        init_options = {
            documentFormatting = true,
            documentRangeFormatting = true,
            hover = true,
            documentSymbol = true,
            codeAction = true,
            completion = true,
        },
        settings = {
            languages = {
                lua = { luacheck, stylua },
                python = { mypy, ruff },
                json = { eslint_d, fixjson },
                jsonc = { eslint_d, fixjson },
                sh = { shellcheck, shfmt },
                markdown = { prettier_d },
                docker = { hadolint, prettier_d },
                c = { clangformat, clang_tidy },
                cpp = { clangformat, clang_tidy },
            },
        },
    })
end

return {
    "neovim/nvim-lspconfig",
    config = config,
    lazy = false,
    dependencies = {
        "windwp/nvim-autopairs",
        "williamboman/mason.nvim",
        "creativenull/efmls-configs-nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
    },
}
