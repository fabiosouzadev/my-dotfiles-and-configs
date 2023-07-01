local M = {}

M.signs = {
  add = { text = "+" },
  change = { text = "~" },
  delete = { text = "_" },
  topdelete = { text = "‾" },
  changedelete = { text = "~" },
}

M.current_line_blame = true

M.on_attach = function(bufnr)
    require ("core.utils").load_mappings("gitsigns", { buffer = bufnr })
end

return M
