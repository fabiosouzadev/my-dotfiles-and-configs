return {
  ensure_installed = require("plugins.configs.ensure_installs").ensure_installed_treesitter,
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  indent = { enable = true},
  autopairs = {
    enable = true,
  },
}