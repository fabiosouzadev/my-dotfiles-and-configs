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
  highlight = { 
    enable = true,
    additional_vim_regex_highlighting = true
  }, 
  incremental_selection = { 
    enable = true 
  }, 
  textobjects = { 
    enable = true
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