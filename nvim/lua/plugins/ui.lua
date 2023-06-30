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
-- Tabline
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
              text_align = "center",
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
-- Statusline
{
  'nvim-lualine/lualine.nvim',
  event = 'VimEnter',
  opts = function()
    return {
      options = {
        disabled_filetypes = { 
          statusline = { 
            "dashboard", 
            "alpha" 
          } 
        },
        theme = 'moonfly',
        component_separators = '|',

        section_separators = '',
      },
      sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename', 'lsp_progress' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
      },
    }
  end,
  config = function(_, opts)
    require("lualine").setup(opts)
  end,
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons}
  },
},
}