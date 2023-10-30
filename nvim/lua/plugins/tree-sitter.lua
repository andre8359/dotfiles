local config = function()
   require("nvim-treesitter.configs").setup( {
      build = ':TSUpdate',
      indent = {
         enable = true,
      },
      autotag = {
         enable = true,
      },
      event = {
         "BufReadPre",
         "BufNewFile",
      },
      auto_install = true,
      ensure_installed = {"cpp", "c", "python", "rust", "lua", "markdown", "json", "yaml", "bash", "dockerfile"},
      highlight = {
         enable = true,
         disable = {}
      }
   })
end

return   {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config=config,
    lazy = false,
  }

