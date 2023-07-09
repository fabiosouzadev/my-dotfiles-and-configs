return function(cb, config)
  if config.request == 'attach' then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
    local py = mason_path .. "packages/debugpy/venv/bin/python",
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
  else
    cb({
      type = 'executable',
      command = py,
      args = { '-m', 'debugpy.adapter' },
    })
  end
end