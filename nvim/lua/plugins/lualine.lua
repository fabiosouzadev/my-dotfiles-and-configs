-- Status Line and Bufferline
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    { "kyazdani42/nvim-web-devicons", lazy = true },
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = "moonfly",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename','lsp_progress'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
      },
    })
  end,
}
