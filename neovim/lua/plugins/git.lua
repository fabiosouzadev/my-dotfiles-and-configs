-- Git related plugins
-- use 'tpope/vim-fugitive'
-- use 'tpope/vim-rhubarb'
return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
        -- signs = {
        --   add = { text = "+" },
        --   change = { text = "~" },
        --   delete = { text = "_" },
        --   topdelete = { text = "‾" },
        --   changedelete = { text = "~" },
        -- },
      })
    end,
  },
}
