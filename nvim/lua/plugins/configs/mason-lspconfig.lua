local servers_to_lsp = function()
  servers_to_lsp = {}
  servers = require("plugins.configs.ensure_installs").lsp_to_mason
  for _, value in pairs(servers) do
      table.insert(servers_to_lsp, value.lsp)
  end
  return servers_to_lsp
end
local options = {
  ensure_installed = servers_to_lsp(),
  -- auto-install configured servers (with lspconfig)
  -- automatic_installation = true,
} 

return options