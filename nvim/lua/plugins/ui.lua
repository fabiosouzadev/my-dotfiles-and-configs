return {
-- File Explorer
{ 
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
  end
},
--
-- Tabline
--
-- {
--   'romgrk/barbar.nvim',
--   init = function()
--     -- vim.g.barbar_auto_setup = false
--     require("core.utils").load_mappings "barbar"
--   end,
--   opts = function()
--     return {
--       gitsigns = {
--         added = {enabled = true, icon = '+'},
--         changed = {enabled = true, icon = '~'},
--         deleted = {enabled = true, icon = '-'},
--       },
--     }
--   end,
--   config = function(_, opts)
--     require("barbar").setup(opts)
--   end,
--   dependencies = {
--     'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
--     'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons}
--   },
-- },
{
  'akinsho/bufferline.nvim',
  event = "User FileOpen",
  init = function()
    require("core.utils").lazy_load "bufferline.nvim"
    require("core.utils").load_mappings "bufferline"
  end,
  opts = function()
    return {
      options = {
        diagnostics = "nvim_lsp",
        offsets = {
          {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              separator = true -- use a "true" to enable the default, or set your own character
          }
        },
      },
    }
  end,
  config = function(_, opts)
    require("bufferline").setup(opts)
  end,
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons}
  },
},
}