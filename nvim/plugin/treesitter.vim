:lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "cpp",
  highlight = {
    enable = true,
    disable = {}
    }
}
EOF
