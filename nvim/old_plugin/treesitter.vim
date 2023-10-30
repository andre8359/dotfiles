:lua <<EOF
require'nvim-treesitter.configs'.setup {
   ensure_installed = {"cpp", "c", "python", "rust"},
  highlight = {
    enable = true,
    disable = {}
    }
}
EOF
