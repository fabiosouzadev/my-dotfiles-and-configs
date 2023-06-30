-- All plugins have lazy=true by default,to load a plugin on startup just lazy=false
-- List of all default plugins & their definitions
local plugins = {

"nvim-lua/plenary.nvim",

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

  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  },
  { 
    "EdenEast/nightfox.nvim",
    lazy = true,
    config = function()
    --    vim.cmd('colorscheme carbonfox')
    end
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = true,
    priority = 1000,
    config = function()
        require("rose-pine").setup()
        -- vim.cmd('colorscheme rose-pine')
    end
  },

{
  "NvChad/nvim-colorizer.lua",
  init = function()
    require("core.utils").lazy_load "nvim-colorizer.lua"
  end,
  cmd = { "ColorizerToggle", "ColorizerAttachToBuffer", "ColorizerDetachFromBuffer", "ColorizerReloadAllBuffers" },
  config = function(_, opts)
    require("colorizer").setup(opts)

    -- execute colorizer as soon as possible
    vim.defer_fn(function()
      require("colorizer").attach_to_buffer(0)
    end, 0)
  end,
},

{
  "nvim-tree/nvim-web-devicons",
  config = function(_, opts)
    require("nvim-web-devicons").setup(opts)
  end,
},
-- Treesitter
{
  "nvim-treesitter/nvim-treesitter",
  init = function()
    require("core.utils").lazy_load "nvim-treesitter"
  end,
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  opts = function()
    return require "plugins.configs.treesitter"
  end,
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
},

-- git stuff

-- lsp stuff
-- Useful status updates for LSP
-- {
--   "j-hui/fidget.nvim",
--   event = "VeryLazy",
--   config = true,
-- },
-- Additional lua configuration, makes nvim stuff amazing
{
  "folke/neodev.nvim",
  lazy = true,
  opts = {
      experimental = { pathStrict = true },
  },
  config = true,
},
{
  "williamboman/mason.nvim",
  cmd = { "Mason", "MasonUpdate", "MasonInstall", "MasonUninstall", "MasonInstallAll", "MasonUninstallAll", "MasonLog" },
  opts = function()
    return require "plugins.configs.mason"
  end,
  config = function(_, opts)
    require("mason").setup(opts)
    -- custom nvchad cmd to install all mason binaries listed
    vim.api.nvim_create_user_command("MasonInstallAll", function()
      vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
    end, {})

    vim.g.mason_binaries_list = opts.ensure_installed
  end,
},
{ 
  "williamboman/mason-lspconfig.nvim",
  event = 'BufEnter', 
  -- cmd = { "LspInstall", "LspUninstall" },
  opts = function()
    return require "plugins.configs.mason-lspconfig"
  end,
  config = function(_, opts)
    -- mason-lspconfig
    require("mason-lspconfig").setup(opts)
  end
},
-- {
--   "neovim/nvim-lspconfig",
--   init = function()
--     require("core.utils").lazy_load "nvim-lspconfig"
--   end,
--   config = function()
--     require "plugins.configs.lspconfig"
--   end,
-- },

-- cmp

-- Comments
{
  "numToStr/Comment.nvim",
  keys = {
    { "gcc", mode = "n", desc = "Comment toggle current line" },
    { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
    { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
    { "gbc", mode = "n", desc = "Comment toggle current block" },
    { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
    { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
  },
  config = function(_, opts)
    require("Comment").setup(opts)
  end,
},

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
},

-- Telescope
{
  "nvim-telescope/telescope.nvim",
  dependencies = { 
    "nvim-treesitter/nvim-treesitter",
    { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
  },
  cmd = "Telescope",
  init = function()
    require("core.utils").load_mappings "telescope"
  end,
  opts = function()
    return require "plugins.configs.telescope"
  end,
  config = function(_, opts)
    local telescope = require "telescope"
    telescope.setup(opts)
    telescope.load_extension('fzf')
  end,
},

-- Only load whichkey after all the gui
{
  "folke/which-key.nvim",
  keys = { "<leader>", '"', "'", "`", "c", "v", "g" },
  init = function()
    require("core.utils").load_mappings "whichkey"
  end,
  config = function(_, opts)
    require("which-key").setup(opts)
  end,
},
}

-- install plugins
local configs = require("core.bootstrap").lazy_config
require("lazy").setup(plugins, configs)