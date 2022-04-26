local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
-- Packer can manage itself
use { 'wbthomason/packer.nvim' }


-- Keybinding
use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

-- Visual / Themes
use {'folke/tokyonight.nvim'}
use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
use { 'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons'}
use { 'romgrk/nvim-treesitter-context', requires = { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} }
use {'norcalli/nvim-colorizer.lua'}

-- Navigation
-- File Management / Search
use {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icon
  },
  config = function() require'nvim-tree'.setup {} end
}
use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}
use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
use { 
  'junegunn/fzf.vim', 
  requires = { 'junegunn/fzf', run = ':call fzf#install()' } 
}

-- Editing
use "lukas-reineke/indent-blankline.nvim"


-- Behaviour/tools
use 'wakatime/vim-wakatime'


-- Git
-- COC

-- LSP
use {
  'neovim/nvim-lspconfig',
  config = function()
    require("plugins.lsp").setup()
  end,
  wants = { "cmp-nvim-lsp", "nvim-lsp-installer"}, -- <C-x><C-o>
  requires = {
    "williamboman/nvim-lsp-installer",
  }
}

-- Autocompletion
use {
  "hrsh7th/nvim-cmp",
  config = function()
    require("plugins.lsp.cmp")
  end,
  wants = { "LuaSnip" },
  requires = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    {
      -- Snippets -- for luasnip
      "L3MON4D3/LuaSnip",
      wants = "friendly-snippets"
    },
    "rafamadriz/friendly-snippets",
  }
}
-- Prettier and Lint 
-- JS,Typescript

  if packer_bootstrap then
    require('packer').sync()
  end
end)
