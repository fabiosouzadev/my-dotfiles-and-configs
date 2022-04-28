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
    require('plugins.which-key')
  end
}

-- Visual / Themes
use {'folke/tokyonight.nvim'}

use { 
  'nvim-lualine/lualine.nvim',
  after = "nvim-treesitter",
  wants = {'tokyonight.nvim', 'lualine-lsp-progress'},
  config = function()
    require("plugins.lualine")
  end,  
  requires = { 'kyazdani42/nvim-web-devicons', opt = true } 
}
use { 
  'akinsho/bufferline.nvim', 
  tag = "*",
  config = function()
    require('plugins.bufferline')
  end,
  requires = 'kyazdani42/nvim-web-devicons'
}

use {
  'nvim-treesitter/nvim-treesitter',
  run = ":TSUpdate",
  config = function()
    require('plugins.nvim-treesitter')
  end,
  requires = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-endwise",
  }
}

use {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('plugins.nvim-colorizer')
  end
}

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
  config = function() 
    require('plugins.telescope')
  end,
  requires = { 
    {'nvim-lua/plenary.nvim'},
    {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  }
}

-- use { 
--   'junegunn/fzf.vim',
--   config = function()
--     require('plugins.fzf')
--   end,
--   requires = { 'junegunn/fzf', run = ':call fzf#install()' } 
-- }

-- FZF Lua
use {
  "ibhagwan/fzf-lua",
  config = function()
    require('plugins.fzf-lua')
  end,
  requires = { 'kyazdani42/nvim-web-devicons' }
}

-- Editing
use {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require('plugins.indent-blankline')
  end
}


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
  -- wants = { "nvim-lsp-installer", "lsp_signature.nvim", "cmp-nvim-lsp"}, -- <C-x><C-o>
  requires = {
    "williamboman/nvim-lsp-installer",
    "ray-x/lsp_signature.nvim",
    "b0o/schemastore.nvim",
  }
}

use {'arkav/lualine-lsp-progress'}

-- Autocompletion
use {
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'ray-x/cmp-treesitter',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'rafamadriz/friendly-snippets',
    'onsails/lspkind-nvim',
  },
  config = function()
    require('plugins.cmp')
  end
}

use { 
  'windwp/nvim-autopairs', 
  config = function()
    require('plugins.nvim-autopairs')
  end
}

-- Prettier and Lint 
-- JS,Typescript

  if packer_bootstrap then
    require('packer').sync()
  end
end)
