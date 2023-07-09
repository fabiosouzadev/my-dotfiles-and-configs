local dap, dapui,mason_dap  = require "dap", require "dapui", require "mason-nvim-dap"
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local adapters = require("plugins.configs.ensure_installs").ensure_installed_dap
local M = {}

local opts_mason_nvim_dap = {
  ensure_installed = adapters,
    -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
}
local opts_dap_ui = { 
  floating = { 
    border = "rounded" 
  } 
}

M.setup = function()
  mason_dap.setup(opts_mason_nvim_dap)
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

  -- -- adapters
  -- for _, adapter in pairs(adapters) do
  --   local has_adapter_config, adapter_config = pcall(require, "plugins.dap.adapters." .. adapter)
  --   if has_adapter_config then
  --     dap.adapters[adapter] = adapter_config
  --   end 
  -- end

  -- -- configurations
  -- for _, lang_config in pairs(adapters) do
  --   local has_config, config = pcall(require, "plugins.dap.configurations." .. lang_config)
  --   if has_config then
  --     dap.configurations[lang_config] = config
  --   end 
  -- end

  -- require("dap-python").setup("python", {})
  local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
  local enrich_config = function(config, on_config)
    if not config.pythonPath and not config.python then
      config.pythonPath = mason_path .. "packages/debugpy/venv/bin/python"
    end
    on_config(config)
  end
  dap.adapters.python = {
    type = "executable",
    command = mason_path .. "packages/debugpy/venv/bin/python",
    args = { "-m", "debugpy.adapter" },
    enrich_config = enrich_config,
    options = {
      source_filetype = 'python',
    }
  }

  dap.configurations.python = {
    {
      type = 'python',
      request = 'launch',
      name = 'Launch file',
      program = '${file}',
    },
  }

end
return M