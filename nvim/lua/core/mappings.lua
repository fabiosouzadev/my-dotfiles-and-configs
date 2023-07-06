--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
local M = {}

M.general = {
  n = {
    -- disable arrow keys cause im learning vim ;)
    ["<Up>"] = { "<Nop>", "Disable up" },
    ["<Down>"] = { "<Nop>", "Disable down" },
    ["<Left>"] = { "<Nop>", "Disable left" },
    ["<Right>"] = { "<Nop>", "Disable right" },
  },
}

M.barbar = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<tab>"] = { "<Cmd>BufferNext<CR>", "Goto next buffer" },
    ["<S-tab>"] = { "<Cmd>BufferPrevious<CR>", "Goto prev buffer" },
    -- cycle through buffers
    ["<leader>."] = { "<Cmd>BufferMoveNext<CR>", "Move buffer forward" },
    ["<leader>,"] = { "<Cmd>BufferMovePrevious<CR>", "Move buffer back" },
    --  Pin/unpin buffer
    ["<leader>bp"] = { "<Cmd>BufferPin<CR>", "Pin/Unpin buffer" },
    -- close buffer + hide terminal buffer
    ["<leader>x"] = { "<Cmd>BufferClose<CR>", "Close buffer" },
  },
}

M.bufferline = {
  plugin = true,
  n = {
    -- cycle through buffers
    ["<tab>"] = { "<Cmd>BufferLineCycleNext<CR>", "Goto next buffer" },
    ["<S-tab>"] = { "<Cmd>BufferLineCyclePrev<CR>", "Goto prev buffer" },
    -- cycle through buffers
    ["<leader>."] = { "<Cmd>BufferLineMoveNext<CR>", "Move buffer forward" },
    ["<leader>,"] = { "<Cmd>BufferLineMovePrev<CR>", "Move buffer back" },
    --  Pin/unpin buffer
    ["<leader>bp"] = { "<Cmd>BufferLineTogglePin<CR>", "Pin/Unpin buffer" },
    -- close buffer + hide terminal buffer
    ["<leader>x"] = { "<Cmd>bdelete<CR>", "Close buffer" },
  },
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
  n = {
    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    ["<C-K>"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    ["<leader>rn"] = {
      function()
        vim.lsp.buf.rename()
      end,
      "LSP rename",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["<leader>e"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },

    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },

    --- :Telescope LSP --
    ["<leader>flr"] = { '<cmd>lua require "telescope.builtin".lsp_references()<cr>', "Lsp references" },
    ["<leader>fld"] = { '<cmd>lua require "telescope.builtin".lsp_definitions()<cr>', "Lsp definitions" },
    ["<leader>fli"] = { '<cmd>lua require "telescope.builtin".lsp_implementations()<cr>', "Lsp implementations" },
    ["<leader>flt"] = { '<cmd>lua require "telescope.builtin".lsp_type_definitions()<cr>', "Lsp type_definition" },
  },

  v = {
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
  },
}

M.dap = {
  n = {
    ["<leader>db"] = { function() require('dap').toggle_breakpoint() end, "Toggle Breakpoint" },
    ["<leader>dc"] = { function() require('dap').continue() end, "DAP Continue" },
    ["<leader>dd"] = { function() require('dap').continue() end, "DAP Continue" },
    ["<leader>di"] = { function() require('dap').step_into() end, "DAP Step Into" },
    ["<leader>do"] = { function() require('dap').step_out() end, "DAP Step Out" },
    ["<leader>dO"] = { function() require('dap').step_over() end, "DAP Step Over" },
    ["<leader>dt"] = { function() require('dap').terminate() end, "DAP Terminate" },
    
    
    ["<leader>du"] = { function() require("dapui").toggle({ }) end, "Dap UI" },
    ["<leader>de"] = { function() require("dapui").eval() end, "Dap UI Eval" },
    ["<leader>dh"] = { function() require("dapui").eval() end, "Dap UI Eval" },
    ["<leader>dC"] = { function() require('dapui').close() end, "Dap UI Close" },

    ["<leader>dw"] = { function() require('dapui').float_element('watches', { enter = true }) end, "Dap UI Whatches" },
    ["<leader>ds"] = { function() require('dapui').float_element('scopes', { enter = true }) end, "Dap UI Scopes" },
    ["<leader>dr"] = { function() require('dapui').float_element('repl', { enter = true }) end, "DAP Step REPL" },
  },
  v = {
    ["<leader>de"] = { function() require("dapui").eval() end, "Dap UI Eval" },
  },  
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>ft"] = { "<cmd> Telescope treesitter <CR>", "Find Treesitter" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    -- git
    ["<leader>fc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>fs"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- pick a hidden term
    -- ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope colorscheme <CR>", "theme switcher" },

    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
  },
}

M.blankline = {
  plugin = true,

  n = {
    ["<leader>cc"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,

      "Jump to current context",
    },
  },
}

M.gitsigns = {
  plugin = true,

  n = {
    -- Navigation through hunks
    ["]c"] = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["[c"] = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },

    -- Actions
    ["<leader>hr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },

    ["<leader>hp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },

    ["<leader>hi"] = {
      function()
        require("gitsigns").preview_hunk_inline()
      end,
      "Preview hunk inline",
    },

    ["<leader>hb"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "Blame line",
    },

    ["<leader>htd"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },

    ["<leader>hd"] = {
      function()
        require("gitsigns").diffthis()
      end,
      "Diff this",
    },

    ["<leader>hD"] = {
      function()
        require("gitsigns").diffthis "~"
      end,
      "Diff this",
    },
  },
}

M.whichkey = {
  plugin = true,
  n = {
    ["<leader>wK"] = {
      function()
        vim.cmd "WhichKey"
      end,
      "Which-key all keymaps",
    },
    ["<leader>wk"] = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "Which-key query lookup",
    },
  },
}

return M
