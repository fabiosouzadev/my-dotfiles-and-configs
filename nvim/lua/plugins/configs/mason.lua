local servers_to_mason = function()
  servers_to_mason = {}
  servers = require("plugins.configs.ensure_installs").lsp_to_mason
  for _, value in pairs(servers) do
      table.insert(servers_to_mason, value.mason)
  end
  return servers_to_mason
end

local options = {
  ensure_installed = servers_to_mason(), -- not an option from mason.nvim
  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    },

    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },

  max_concurrent_installers = 10,
}

return options
