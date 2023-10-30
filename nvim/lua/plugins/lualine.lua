local config = function()
    -- local theme = require("lualine.themes.gruvbox")

   require("lualine").setup({
      options = {
         section_separators = { left = '', right = ''},
         theme = "dayfox",
         globalstatus = true,
      },
      tabline = {
         lualine_a = { "buffers" },
      },
      sections = {
         lualine_a = { "mode" },
         lualine_x = { "encoding", "fileformat", "filetype" },
         lualine_y = { "progress" },
         lualine_z = { "location" },
      },
   })
end

return {
   "nvim-lualine/lualine.nvim",
   lazy = false,
   config = config,
}
