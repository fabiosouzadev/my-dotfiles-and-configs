require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'bash',
    'css',
    'scss',
    'dockerfile',
    'go',
    'gomod',
    'graphql',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'lua',
    'python',
    'rust',
    'svelte',
    'tsx',
    'typescript',
    'yaml',
    'php',
  },
  indent = {
      enable = false
  },
  context_commentstring = {
      enable = true
  },
  git = {
      enable = true,
      ignore = true,
      timeout = 500,
  },
}