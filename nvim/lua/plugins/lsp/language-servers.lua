local servers = {
  emmet_ls = {},
  eslint = {},
  html = {},
  jsonls = {
    config = function(opts)
      opts = vim.tbl_deep_extend("force", {
        settings = {json = {schemas = require('schemastore').json.schemas()}}
      }, opts)
      return opts
    end
  },
  sumneko_lua = {
    config = function(opts)
      opts = vim.tbl_deep_extend("force", {
        settings = {
          Lua = {
            runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
            diagnostics = {globals = {'vim'}},
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
              preloadFileSize = 10000
            },
            telemetry = {enable = false}
          }
        }
      }, opts)
      return opts
    end
  },
  tsserver = {},
  vimls = {},
}

return servers
