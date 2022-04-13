-- https://github.com/ChristianChiarulli/nvim/blob/master/lua/user/plugins.lua

-- Plugins   
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
use 'wbthomason/packer.nvim'

-- Visual / Themes
use 'folke/tokyonight.nvim'
use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
use { 'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons'}
use { 'romgrk/nvim-treesitter-context', requires = { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} }

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
use { 
  'junegunn/fzf.vim', 
  requires = { 'junegunn/fzf', run = ':call fzf#install()' } 
}

-- Editing
-- Behaviour/tools
-- Git
-- COC
-- LSP
-- Autocompletion and Snippets
-- Prettier and Lint 
-- JS,Typescript

  if packer_bootstrap then
    require('packer').sync()
  end
end)