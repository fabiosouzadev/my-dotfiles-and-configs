local dap, dapui,mason_dap  = require "dap", require "dapui", require "mason-nvim-dap"
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local adapters = require("plugins.configs.ensure_installs").ensure_installed_dap
local configurations = require("plugins.configs.ensure_installs").ensure_installed_dap
local M = {}

local opts_mason_nvim_dap = {
  ensure_installed = adapters,
    -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed 
  handlers = {} 
}
local opts_dap_ui = { 
  floating = { 
    border = "rounded" 
  } 
}

M.setup = function()
  mason_dap.setup { opts_mason_nvim_dap }
  -- ╭──────────────────────────────────────────────────────────╮
  -- │ DAP Setup                                                │
  -- ╰──────────────────────────────────────────────────────────╯
  dap.set_log_level("TRACE")
  dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
  dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
  dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
  -- ╭──────────────────────────────────────────────────────────╮
  -- │ DAP UI Setup                                             │
  -- ╰──────────────────────────────────────────────────────────╯
  dapui.setup(opts_dap_ui)

  -- ╭──────────────────────────────────────────────────────────╮
  -- │ Icons                                                    │
  -- ╰──────────────────────────────────────────────────────────╯
  vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
  vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })

  -- adapters
  for _, adapter in pairs(adapters) do
    dap.adapters[adapter] = pcall(require, "plugins.dap.adapters." .. adapter)
  end

  -- configurations
  for _, configs in pairs(adapters) do
    dap.configurations[configs] = pcall(require, "plugins.dap.configurations." .. configs)
  end


end

return M