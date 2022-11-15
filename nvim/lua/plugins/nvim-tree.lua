require'nvim-tree'.setup {
  diagnostics = {
    enable = true,
  },
  filters = {
    custom = {'.git$', '.gitignore', 'node_modules', '.cache'}
  }
}
