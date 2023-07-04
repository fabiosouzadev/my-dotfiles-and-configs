local M = {}

M.setup = {
  -- ensure these language parsers are installed
  ensure_installed = require("plugins.configs.ensure_installs").ensure_installed_treesitter,
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  indent = { enable = true},
  autopairs = {
      enable = true,
  },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- ensure these language parsers are installed
  auto_install = true,
  incremental_selection = {
      enable = true,
      keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<c-backspace>',
      },
  },
  textobjects = {
      select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
          },
      },
      move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
          },
          goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
          },
          goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
          },
          goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
          },
      },
      swap = {
          enable = true,
          swap_next = {
              ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
              ['<leader>A'] = '@parameter.inner',
          },
      },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

M.context_setup = function()
  require("treesitter-context").setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
      -- For all filetypes
      -- Note that setting an entry here replaces all other patterns for this entry.
      -- By setting the 'default' entry below, you can control which nodes you want to
      -- appear in the context window.
      default = {
        'class',
        'function',
        'method',
      },
    },
  }
end

return M