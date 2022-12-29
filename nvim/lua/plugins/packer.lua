-- Automatically install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  -- Packer can manage itself
  use({ "wbthomason/packer.nvim" })

  use({ "nvim-lua/plenary.nvim" }) -- lua functions that many plugins use
  use({ "kyazdani42/nvim-web-devicons" })
  use({ "windwp/nvim-autopairs" })

  ----------------------
  -- Visual / Themes --
  ---------------------

  --  Colorschemes   --
  use({ "folke/tokyonight.nvim" })
  -- use({ "rose-pine/neovim", as = "rose-pine" })

  -- Visual --
  use({ "goolord/alpha-nvim" })
  use({ "nvim-lualine/lualine.nvim" })
  use({ "arkav/lualine-lsp-progress" })
  use({ "akinsho/bufferline.nvim", tag = "v3.*" })
  use({ "kyazdani42/nvim-tree.lua", tag = "nightly" })
  use({ "lukas-reineke/indent-blankline.nvim" })
  use({ "norcalli/nvim-colorizer.lua" })

  ----------------------
  --   Keybinding   --
  ---------------------
  use({ "folke/which-key.nvim" })
  use({ "alexghergh/nvim-tmux-navigation" })
  ----------------------
  --    Navigation    --
  ---------------------
  -- Telescope
  use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "nvim-telescope/telescope-file-browser.nvim" })
  -- Harpoon
  use({ "ThePrimeagen/harpoon" })
  ----------------------
  --    Code        --
  ---------------------

  -- configuring lsp servers
  use({ "neovim/nvim-lspconfig" }) -- easily configure language servers
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  use({ "onsails/lspkind.nvim" }) -- vs-code like icons for autocompletion
  use({ "folke/trouble.nvim" })

  -- formatting & linting
  use({ "jose-elias-alvarez/null-ls.nvim" }) -- configure formatters & linters
  use({ "jayp0521/mason-null-ls.nvim" }) -- bridges gap b/w mason & null-ls

  -- autocompletion
  use({ "hrsh7th/cmp-nvim-lsp" }) -- for autocompletion
  use({ "ray-x/cmp-treesitter" }) -- for autocompletion
  use({ "hrsh7th/cmp-buffer" }) -- source for text in buffer
  use({ "hrsh7th/cmp-path" }) -- source for file system paths
  use({ "hrsh7th/nvim-cmp" }) -- completion plugin
  use({ "tzachar/cmp-tabnine", run = "./install.sh" }) -- ${HOME}/.local/share/nvim/site/pack/packer/start/cmp-tabnine/install.sh

  -- snippets
  use({ "L3MON4D3/LuaSnip" }) -- snippet engine
  use({ "saadparwaiz1/cmp_luasnip" }) -- for autocompletion
  use({ "rafamadriz/friendly-snippets" }) -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  use({ "williamboman/mason.nvim" }) -- in charge of managing lsp servers, linters & formatters
  use({ "williamboman/mason-lspconfig.nvim" }) -- bridges gap b/w mason & lspconfig

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })
  use({ "nvim-treesitter/nvim-treesitter-context" })

  use({ "windwp/nvim-ts-autotag" }) -- autoclose tags
  use({ "numToStr/Comment.nvim" }) -- gc,gb, gcc
  use({ "lewis6991/gitsigns.nvim" })

  -- Behaviour/tools
  use({ "wakatime/vim-wakatime" })

  -- Others
  use({ "ThePrimeagen/vim-be-good" })

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
