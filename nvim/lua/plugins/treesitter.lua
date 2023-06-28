return  {
  "nvim-treesitter/nvim-treesitter",
  init = function()
    require("core.utils").lazy_load "nvim-treesitter"
  end,
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  opts = function()
    return {
      ensure_installed = { 
        "bash",
        "c",
        "c_sharp",
        "css",
        "dart",
        "dockerfile",
        "gitignore",
        "go",
        "graphql",
        "html",
        "http",
        "java",
        "javascript",
        "jsonc",
        "kotlin",
        "lua",
        "markdown",
        "php",
        "python",
        "scss",
        "sql",
        "svelte",
        "toml",
        "tsx",
        "twig",
        "typescript",
        "vim",
        "vue",
        "yaml",
      },
      highlight = {
        enable = true, -- false will disable the whole extension
      },
      indent = { enable = true},
      autopairs = {
        enable = true,
      },
    }
  end,
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}