local M = {}

-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
M.lsp_to_mason = {
  { lsp = "bashls", mason = "bash-language-server" },
  { lsp = "clangd", mason = "clangd" },
  { lsp = "cssls", mason = "css-lsp" },
  { lsp = "diagnosticls", mason = "diagnostic-languageserver" },
  { lsp = "docker_compose_language_service", mason = "docker-compose-language-service" },
  { lsp = "dockerls", mason = "dockerfile-language-server" },
  { lsp = "emmet_ls", mason = "emmet-ls" },
  { lsp = "eslint", mason = "eslint-lsp" },
  -- { lsp = "gopls", mason = "gopls" },
  { lsp = "html", mason = "html-lsp" },
  { lsp = "jsonls", mason = "json-lsp" },
  { lsp = "kotlin_language_server", mason = "kotlin-language-server" },
  { lsp = "pyright", mason = "pyright" },
  { lsp = "rust_analyzer", mason = "rust-analyzer" },
  { lsp = "lua_ls", mason = "lua-language-server" },
  { lsp = "sqlls", mason = "sqlls" },
  { lsp = "svelte", mason = "svelte-language-server" },
  { lsp = "tsserver", mason = "typescript-language-server" },
  { lsp = "tailwindcss", mason = "tailwindcss-language-server" },
  { lsp = "vimls", mason = "vim-language-server" },
  { lsp = "volar", mason = "vue-language-server" },
  { lsp = "yamlls", mason = "yaml-language-server" },
}

M.ensure_installed_null_ls = {
  -- formatting
  "prettierd", -- ts/js formatter
  "stylua", -- lua formatter
  "black",
  "fixjson",
  -- diagnostics
  "flake8",
  "markdownlint",
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

M.ensure_installed_dap = {
  "python",
}



  return M
