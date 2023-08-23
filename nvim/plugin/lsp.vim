:lua << EOF
  local nvim_lsp = require('lspconfig')
  local on_attach = function(_, bufnr)
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F4>', '<cmd>ClangdSwitchSourceHeader<CR>', opts)
  end

  local cmp = require('cmp')

  cmp.setup({
      snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
      },
     window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-a>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        }, {
           { name = 'buffer' },
        })
        })

  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  nvim_lsp['clangd'].setup {
   on_attach = on_attach,
   cmd = {
      'clangd',
      '--all-scopes-completion',
      '--background-index',
      '--clang-tidy',
      '--completion-style=detailed',
      '--cross-file-rename',
      '--header-insertion=iwyu',
      '-j=8',
      '--malloc-trim',
      '--pch-storage=memory',
      '--compile-commands-dir=/home/adantas/Documents/svc/build'
   },
   capabilities = capabilities
 }

  nvim_lsp['rust_analyzer'].setup {
   on_attach = on_attach,
   cmd = {'rust-analyzer'},
   diagnostics = {
        enable = false;
      }
   }


local servers = {'pylsp', 'cmake'}

for _, lsp in pairs(servers) do
   nvim_lsp[lsp].setup {
      on_attach = on_attach,
   }
end

EOF

"----------------------
" Completion options
"----------------------
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
