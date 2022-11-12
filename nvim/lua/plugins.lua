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
  use {'wbthomason/packer.nvim'}


  ----------------------
  -- Visual / Themes --
  ---------------------

  --  Colorschemes   --
  use { 'folke/tokyonight.nvim' , config = "require('colorschemes.tokyonight')"  }

  use { 'goolord/alpha-nvim' ,requires = { 'kyazdani42/nvim-web-devicons' }, config = "require('configs.alpha-nvim').setup()"}
  use { 'nvim-lualine/lualine.nvim' , wants = { 'tokyonight.nvim', 'lualine-lsp-progress' }, event = 'BufRead', config = "require('configs.lualine')",requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use { 'arkav/lualine-lsp-progress' }
  use { 'akinsho/bufferline.nvim' , tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons',event = "BufWinEnter",config = "require('configs.bufferline')"}
  use { 'kyazdani42/nvim-tree.lua' ,requires = 'kyazdani42/nvim-web-devicons',cmd = "NvimTreeToggle",config = "require('configs.nvim-tree')", tag = 'nightly'}
  use { 'lukas-reineke/indent-blankline.nvim', config = "require('configs.indent-blankline')" , event = "BufReadPre" }
  use { 'norcalli/nvim-colorizer.lua', config = "require('configs.nvim-colorizer')", event = "BufRead"}

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate", event = 'BufRead', wants = { "nvim-treesitter-textobjects", "nvim-treesitter-context","nvim-autopairs"  }, requires = "nvim-treesitter/nvim-treesitter-textobjects", { 'romgrk/nvim-treesitter-context', config= "require('configs.nvim-treesitter-context')"}, config = "require('configs.nvim-treesitter')" }

  ----------------------
  --    Keybinding     --
  ---------------------
  use { 'folke/which-key.nvim', event = "BufWinEnter", config = "require('configs.which-key')" }
  use { 'alexghergh/nvim-tmux-navigation', config = "require('configs.nvim-tmux-navigation')" }

  ----------------------
  --    Navigation    --
  ---------------------
  -- Telescope
  use { 'nvim-telescope/telescope.nvim', opt = true, config = "require('configs.telescope')", cmd = { "Telescope" }, module = "telescope", wants = { "plenary.nvim", "telescope-fzf-native.nvim" }, requires = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", run = "make" } } }
  -- Fzf-lua
  use { 'ibhagwan/fzf-lua', config= "require('configs.fzf-lua')",event = "BufEnter",wants = 'nvim-web-devicons' ,requires = 'kyazdani42/nvim-web-devicons' }

  ----------------------
  --    Code        --
  ---------------------
  use { 'numToStr/Comment.nvim', config = "require('configs.comment')"} -- gc,gb

  -- Git
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = "require('configs.gitsigns')"}

  ----------------------
  --    CMP/Snippets        --
  ---------------------
  use {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    opt = true,
    config = "require('configs.cmp')",
    wants = {'lspkind-nvim'},
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'ray-x/cmp-treesitter',
      'rafamadriz/friendly-snippets',
      'onsails/lspkind-nvim',
    }
  }

  use { 'windwp/nvim-autopairs', config = "require('configs.nvim-autopairs')", after = "nvim-cmp" }

  ----------------------
  --    LSP        --
  ---------------------
  use {
    "neovim/nvim-lspconfig", -- enable LSP
    opt = true,
    event = "BufReadPre",
    wants = { 'plenary.nvim',"nvim-lsp-installer","cmp-nvim-lsp","null-ls.nvim" },
    config = "require('lsp')",
    requires = {
      "nvim-lua/plenary.nvim",
      "williamboman/nvim-lsp-installer", -- simple to use language server installer
      "tamago324/nlsp-settings.nvim", -- language server settings defined in json for
      {"jose-elias-alvarez/null-ls.nvim",config = "require('lsp.null-ls')"}, -- for formatters and linters
    },
  }

  use {"glepnir/lspsaga.nvim",event = "VimEnter",cmd = { "Lspsaga" },config ="require('lsp.lspsaga')", after = "nvim-lspconfig"}

  -- Behaviour/tools
  use {'wakatime/vim-wakatime'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end

end)
