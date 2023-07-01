local M = {}
M.signs =  {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn",  text = "" },
  { name = "DiagnosticSignHint",  text = "" },
  { name = "DiagnosticSignInfo",  text = "" },
}

M.setup_diagnostics = function(signs)
  -- Set up diagnostic signs
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end
end
-- export on_attach & capabilities for custom lspconfigs
M.on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  require "core.utils".load_mappings("lspconfig", { buffer = bufnr })

  -- if client.server_capabilities.signatureHelpProvider then
  --   require("nvchad_ui.signature").setup(client)
  -- end

  -- if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
  --   client.server_capabilities.semanticTokensProvider = nil
  -- end
end

-- M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

-- diagnostics
M.setup_diagnostics(M.signs)

-- lspconfig
local servers_to_lsp = function()
  servers_to_lsp = {}
  servers = require("plugins.configs.ensure_installs").lsp_to_mason
  for _, value in pairs(servers) do
      table.insert(servers_to_lsp, value.lsp)
  end
  return servers_to_lsp
end

local svrs = servers_to_lsp()

for _, server in pairs(svrs) do
  local cap_opts = {
      on_attach = M.on_attach,
      capabilities = M.capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "plugins.lsp.providers." .. server)
  if has_custom_opts then
      cap_opt = vim.tbl_deep_extend("force", server_custom_opts, cap_opts)
  end
  require("lspconfig")[server].setup(cap_opts)
end

return M