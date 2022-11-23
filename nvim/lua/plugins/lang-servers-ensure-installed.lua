local M = {}
M.ensure_installed_lsp = {
  "cssls",
  "tailwindcss",
  "sumneko_lua",
  "emmet_ls",
  "html",
  "jsonls",
  "sumneko_lua",
  "tsserver",
  "pyright",
  "bashls",
  "yamlls",
  "rust_analyzer",
  "gopls",
  "cssls",
  "vimls",
}

M.ensure_installed_null_ls = {
  "prettier", -- ts/js formatter
  "stylua", -- lua formatter
  "eslint_d", -- ts/js linter
  "black",
  "flake8",
  "fixjson",
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
