return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.1',
  dependencies = { 
    "nvim-lua/plenary.nvim"
  },
  cmd = "Telescope",
  init = function()
    require("core.utils").load_mappings "telescope"
  end,
  opts = function()
    return {
      defaults = {
        file_ignore_patterns = { "node_modules" },
        mappings = {
          n = { ["q"] = require("telescope.actions").close },
        },
      },
    }
  end,
  config = function(_, opts)
    require("telescope").setup(opts)
  end,
}