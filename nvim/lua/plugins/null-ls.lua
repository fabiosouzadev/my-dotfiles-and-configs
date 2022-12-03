local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local hover = null_ls.builtins.hover
local completion = null_ls.builtins.completion

local sources = {
  -- formatting
  formatting.prettierd,
  formatting.black.with({ extra_args = { "--fast" } }),
  formatting.stylua,
  formatting.fixjson,
  -- diagnostics
  diagnostics.flake8,
  diagnostics.eslint_d.with({ -- js/ts linter
    -- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
    condition = function(utils)
      return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
    end,
  }),
  -- code actions
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

local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
  if client.supports_method("textDocument/rangeFormatting") then
    vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
  end
end

null_ls.setup({
  debug = true,
  sources = sources,
  on_attach = on_attach,
})
