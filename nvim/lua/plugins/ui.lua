-- "rcarriga/nvim-notify",
-- "stevearc/dressing.nvim",
-- "lukas-reineke/indent-blankline.nvim",
-- "folke/noice.nvim",
-- "goolord/alpha-nvim",
-- 'tpope/vim-sleuth'
return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-web-devicons",
    },
    config = function()
      require("lualine").setup({
        options = {
          theme = "moonfly",
          component_separators = "|",
          section_separators = "",
        },
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = {
      "nvim-web-devicons",
    },
    config = true,
    event = "VeryLazy",
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
}
