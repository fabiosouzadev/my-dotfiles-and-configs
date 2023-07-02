local M = {}
local null_ls = require("null-ls")
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
-- local hover = null_ls.builtins.hover
local completion = null_ls.builtins.completion


M.sources = {
  -- snippets support
  completion.luasnip,
  -- formatting
  formatting.black.with({ extra_args = { "--line-length", "79", "-t", "py37", "--skip-string-normalization" } }),
  formatting.stylua,
  formatting.fixjson,
  formatting.eslint_d,
  formatting.prettierd.with({
    env = {
      PRETTIERD_LOCAL_PRETTIER_ONLY = 1,
    },
  }),
  -- diagnostics
  diagnostics.markdownlint,
  diagnostics.flake8,
  diagnostics.eslint_d.with({ -- js/ts linter
      -- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
      condition = function(utils)
          return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
      end,
  }),
  -- code actions
  code_actions.gitsigns,
  code_actions.eslint_d,
  -- hover
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

-- -- Format on save
-- local on_attach = function(client, bufnr)
--     if client.supports_method("textDocument/formatting") then
--         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--         vim.api.nvim_create_autocmd("BufWritePre", {
--             group = augroup,
--             buffer = bufnr,
--             callback = function()
--                 lsp_formatting(bufnr)
--             end,
--         })
--     end
--     if client.supports_method("textDocument/rangeFormatting") then
--         vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
--     end
-- end



M.servers = require("plugins.configs.ensure_installs").ensure_installed_null_ls


return M