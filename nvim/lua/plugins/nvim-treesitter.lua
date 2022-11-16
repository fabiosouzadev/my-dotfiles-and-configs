require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true },
  autopairs = {
    enable = true,
  },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- ensure these language parsers are installed
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
    "help",
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
  -- auto install above language parsers
  auto_install = true,
  incremental_selection = {
    enable = true
  },
  textobjects = {
    enable = true
  },
  -- context_commentstring = {
  --   enable = true,
  --   enable_autocmd = false,
  -- },
}
