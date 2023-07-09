-- All plugins have lazy=true by default,to load a plugin on startup just lazy=false
-- List of all default plugins & their definitions
local plugins = {
  -- tokyonight
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd "colorscheme tokyonight-storm"
  --   end,
  -- },

  -- catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-frappe"
    end
  },
  -- {
  --   "EdenEast/nightfox.nvim",
  --   config = function()
  --   --    vim.cmd('colorscheme carbonfox')
  --   end
  -- },
  -- rosepine
  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   priority = 1000,
  --   config = function()
  --       require("rose-pine").setup()
  --       vim.cmd('colorscheme rose-pine')
  --   end
  -- },

  -- kanagawa.nvim
  -- {
  --   "rebelot/kanagawa.nvim",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd("colorscheme kanagawa-wave")
  --   end
  -- },
  {
    "nvim-lua/plenary.nvim",
    cmd = { "PlenaryBustedFile", "PlenaryBustedDirectory" },
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function(_, opts)
      require("nvim-web-devicons").setup(opts)
    end,
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

  -- Toggle floating terminal on <F7> [term]
  -- https://github.com/akinsho/toggleterm.nvim
  -- neovim bug → https://github.com/neovim/neovim/issues/21106
  -- workarounds → https://github.com/akinsho/toggleterm.nvim/wiki/Mouse-support
  {
    "akinsho/toggleterm.nvim",
    -- cmd = { "ToggleTerm", "TermExec" },
    opts = {
      size = 10,
      open_mapping = [[<C-\>]],
      shading_factor = 2,
      direction = "float",
      float_opts = {
        border = "curved",
        highlights = { border = "Normal", background = "Normal" },
      },
    },
  },

  -- indent-blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    init = function()
      require("core.utils").lazy_load "indent-blankline.nvim"
    end,
    opts = function()
      return require "plugins.configs.indent-blankline"
    end,
    config = function(_, opts)
      require("core.utils").load_mappings "blankline"
      require("indent_blankline").setup(opts)
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
      {
        "nvim-treesitter/nvim-treesitter-context",
        lazy = true,
        config = function()
          require("plugins.configs.treesitter").context_setup()
        end,
      },
      "windwp/nvim-ts-autotag",
    },
    init = function()
      require("core.utils").lazy_load "nvim-treesitter"
    end,
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require("plugins.configs.treesitter").setup
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- git stuff
  {
    "lewis6991/gitsigns.nvim",
    -- ft = { "gitcommit", "diff" },
    event = "BufRead",
    opts = function()
      return require "plugins.configs.gitsigns"
    end,
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },

  -- cmp stuff
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("plugins.configs.luasnip").luasnip(opts)
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },
      -- Tabnine?
      -- Copilot?
      -- cmp sources plugins
      {
        "onsails/lspkind.nvim",
        "saadparwaiz1/cmp_luasnip",
        "ray-x/cmp-treesitter",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    opts = function()
      return require "plugins.configs.cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },

  -- lsp stuff
  -- Useful status updates for LSP
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = true,
  },
  -- Additional lua configuration, makes nvim stuff amazing
  {
    "folke/neodev.nvim",
    opts = {
      experimental = { pathStrict = true },
    },
    config = true,
  },
  -- Mason
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    cmd = {
      "Mason",
      "MasonUpdate",
      "MasonInstall",
      "MasonUninstall",
      "MasonInstallAll",
      "MasonUninstallAll",
      "MasonLog",
    },
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

  -- mason-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufEnter",
    -- cmd = { "LspInstall", "LspUninstall" },
    opts = function()
      return require "plugins.configs.mason-lspconfig"
    end,
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
    end,
  },
 -- nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    init = function()
      require("core.utils").lazy_load "nvim-lspconfig"
    end,
    config = function()
      require "plugins.configs.lspconfig"
    end,
  },

  -- formatters
  -- {{{ Null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      {
        "jay-babu/mason-null-ls.nvim",
        cmd = { "NullLsInstall", "NullLsUninstall" },
        opts = { handlers = {} },
      },
    },
    init = function()
      require("core.utils").lazy_load "null-ls.nvim"
    end,
    opts = function()
      return require "plugins.configs.null-ls"
    end,
    config = function(_, opts)
      -- mason_null_ls
      require("mason-null-ls").setup {
        ensure_installed = opts.servers.ensure_installed_null_ls,
        -- auto-install configured servers (with lspconfig)
        -- automatic_installation = true, -- not the same as ensure_installed
      }
      require("null-ls").setup {
        debug = true,
        sources = opts.sources,
        -- on_attach = on_attach,
      }
    end,
  },

  -- dap
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim", 
        cmd = { "DapInstall", "DapUninstall" }
      },
      {"rcarriga/nvim-dap-ui"},
      -- {"theHamsta/nvim-dap-virtual-text"},
      -- {"mfussenegger/nvim-dap-python"},
      -- { "nvim-telescope/telescope-dap.nvim"},
    },
    init = function()
      require("core.utils").lazy_load "nvim-dap"
      require("core.utils").load_mappings "dap"
    end,
    config = function()
      require "plugins.configs.dap".setup()
    end,
  },

  -- ----------------------------------------------------------------------- }}}
  -- {
  --   "glepnir/lspsaga.nvim",
  --   event = "BufRead",
  --   config = function()
  --       require("lspsaga").setup({})
  --   end,
  --   dependencies = { { "nvim-web-devicons" } },
  -- },
  -- {
  --   "folke/trouble.nvim",
  --    event = "BufRead"
  --   requires = "nvim-web-devicons",
  --   config = true,
  -- },

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
    "nvim-tree/nvim-tree.lua",
    version = "nightly",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    init = function()
      require("core.utils").load_mappings "nvimtree"
    end,
    opts = function()
      return require "plugins.configs.nvim-tree"
    end,
    config = function(_, opts)
      local nvimtree = require "nvim-tree"
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.opt.termguicolors = true

      nvimtree.setup(opts)
    end,
  },

  -- Tabline
  {
    "akinsho/bufferline.nvim",
    event = "User FileOpen",
    init = function()
      require("core.utils").lazy_load "bufferline.nvim"
      require("core.utils").load_mappings "bufferline"
    end,
    opts = function()
      return require "plugins.configs.bufferline"
    end,
    config = function(_, opts)
      require("bufferline").setup(opts)
    end,
  },

  -- {
  --   'romgrk/barbar.nvim',
  --   init = function()
  --     require("core.utils").lazy_load "barbar.nvim"
  --     require("core.utils").load_mappings "barbar"
  --   end,
  --   config = function(_, opts)
  --     require("barbar").setup(opts)
  --   end,
  -- },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    opts = function()
      return require "plugins.configs.lualine"
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
      telescope.load_extension "fzf"
    end,
  },

  -- others
  {
    "wakatime/vim-wakatime",
  },
  {
    "ThePrimeagen/vim-be-good",
    event = "VeryLazy",
    lazy = true,
  },
  {
    "ThePrimeagen/harpoon",
    event = "BufEnter",
    lazy = true,
  },

  -- TMUX
  {
    "aserowy/tmux.nvim",
    config = function()
      return require("tmux").setup()
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
