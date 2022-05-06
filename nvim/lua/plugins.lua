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
  use { 'wbthomason/packer.nvim' } -- Packer can manage itself
  use { 'nvim-lua/popup.nvim' } -- An implementation of the Popup API from vim in Neovim
  use { 'nvim-lua/plenary.nvim' } -- Useful lua functions used ny lots of plugins
  use { 'windwp/nvim-autopairs' } -- Autopairs, integrates with both cmp and treesitter
  use { 'numToStr/Comment.nvim' }
  use { 'akinsho/toggleterm.nvim' }
  use { 'glepnir/dashboard-nvim' }
  use { 'folke/which-key.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'norcalli/nvim-colorizer.lua' }
  -------------------
  -- Colorschemes --
  -------------------
  use { 'folke/tokyonight.nvim' }

  ----------------------
  -- Visual / Themes --
  ---------------------
  use { 'kyazdani42/nvim-web-devicons', opt = true }
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'akinsho/bufferline.nvim', tag = "*" }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'arkav/lualine-lsp-progress' }
  use { 'lukas-reineke/indent-blankline.nvim' }


  -- LSP
  use { 'neovim/nvim-lspconfig' } -- enable LSP
  use { 'williamboman/nvim-lsp-installer' } -- simple to use language server installer
  use { 'tamago324/nlsp-settings.nvim' } -- language server settings defined in json for
  use { 'jose-elias-alvarez/null-ls.nvim' } -- for formatters and linters
  -- use { 'antoinemadec/FixCursorHold.nvim' } -- This is needed to fix lsp doc highlight


  -- CMP
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/nvim-cmp' }

  -- snippets
  use { 'hrsh7th/cmp-vsnip' }
  use { 'hrsh7th/vim-vsnip' }
  use { 'rafamadriz/friendly-snippets' }


  use { 'onsails/lspkind-nvim' }
  use { 'glepnir/lspsaga.nvim' }

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "ibhagwan/fzf-lua"

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "nvim-treesitter/nvim-treesitter-textobjects" }
  use { "RRethy/nvim-treesitter-endwise" }
  use { 'romgrk/nvim-treesitter-context' }


  -- Git
  use {"lewis6991/gitsigns.nvim"}

  -- Behaviour/tools
  use {'wakatime/vim-wakatime'}
  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end

end)
