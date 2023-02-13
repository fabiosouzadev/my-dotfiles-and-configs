local M = {}
M.ensure_installed_lsp = {
  "cssls",
  "lua_ls",
  "emmet_ls",
  "html",
  "jsonls",
  "tsserver",
  "pyright",
  "bashls",
  "yamlls",
  "rust_analyzer",
  "cssls",
  "volar",
  "tailwindcss",
}

M.ensure_installed_null_ls = {
  -- formatting
  "prettierd", -- ts/js formatter
  "stylua", -- lua formatter
  "black",
  "fixjson",
  -- diagnostics
  "flake8",
  -- code_action
  "eslint_d", -- ts/js linter
  -- hover
}

M.ensure_installed_treesitter = {
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
}

return M
