return {
  'nvim-tree/nvim-tree.lua',
  version = 'nightly',
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  init = function()
    require("core.utils").load_mappings "nvimtree"
  end,
  opts = function()
    return {
      filters = {
        dotfiles = false,
        exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
      },
      diagnostics = {
        enable = true,
      },
    }
  end,
  config = function(_, opts)
      local nvimtree = require 'nvim-tree'
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.opt.termguicolors = true

      nvimtree.setup(opts)
  end,
}