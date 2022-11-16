-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
  diagnostics = {
    enable = true,
  },
  filters = {
    custom = { ".git$", ".gitignore", "node_modules", ".cache" },
  },
})
