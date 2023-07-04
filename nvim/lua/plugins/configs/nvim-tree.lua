return {
  filters = {
    dotfiles = false,
    exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
  },
  diagnostics = {
    enable = true,
  },
}