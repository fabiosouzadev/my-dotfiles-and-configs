return {

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = { style = "night" },
    config = function()
        vim.cmd("colorscheme tokyonight-night")
    end
  },

  -- -- catppuccin
  -- {
  --   "catppuccin/nvim",
  --   lazy = true,
  --   name = "catppuccin",
  -- },
  -- { 
  --   "EdenEast/nightfox.nvim",
  --   lazy = true,
  --   config = function()
  --   --    vim.cmd('colorscheme carbonfox')
  --   end
  -- },
  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   lazy = true,
  --   priority = 1000,
  --   config = function()
  --       require("rose-pine").setup()
  --       -- vim.cmd('colorscheme rose-pine')
  --   end
  -- },
}
