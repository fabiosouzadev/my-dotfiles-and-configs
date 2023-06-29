return  {
  "nvim-treesitter/nvim-treesitter",
  init = function()
    require("core.utils").lazy_load "nvim-treesitter"
  end,
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  opts = function()
    return {
      ensure_installed = require("core.ensure_installs").ensure_installed_treesitter,
      highlight = {
        enable = true, -- false will disable the whole extension
      },
      indent = { enable = true},
      autopairs = {
        enable = true,
      },
    }
  end,
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}