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
    ["<Up>"] = {"<Nop>", "Disable up"},
    ["<Down>"] = {"<Nop>", "Disable down"},
    ["<Left>"] = {"<Nop>", "Disable left"},
    ["<Right>"] = {"<Nop>", "Disable right"}
  },
}

-- M.barbar = {
--   plugin = true,

--   n = {
--     -- cycle through buffers
--     ["<tab>"] = { "<Cmd>BufferNext<CR>", "Goto next buffer"},
--     ["<S-tab>"] = { "<Cmd>BufferPrevious<CR>", "Goto prev buffer"},
--      -- cycle through buffers
--     ["<leader>."] = { "<Cmd>BufferMoveNext<CR>", "Move buffer forward"},
--     ["<leader>,"] = { "<Cmd>BufferMovePrevious<CR>", "Move buffer back"},
--     --  Pin/unpin buffer
--     ["<C-p>"] = { "<Cmd>BufferPin<CR>", "Pin/Unpin buffer"},
--     -- close buffer + hide terminal buffer
--     ["<leader>x"] = { "<Cmd>BufferClose<CR>", "Close buffer"},
--   },
-- }

M.bufferline = {
  plugin = true,
  n = {
    -- cycle through buffers
    ["<tab>"] = { "<Cmd>BufferLineCycleNext<CR>", "Goto next buffer"},
    ["<S-tab>"] = { "<Cmd>BufferLineCyclePrev<CR>", "Goto prev buffer"},
     -- cycle through buffers
    ["<leader>."] = { "<Cmd>BufferLineMoveNext<CR>", "Move buffer forward"},
    ["<leader>,"] = { "<Cmd>BufferLineMovePrev<CR>", "Move buffer back"},
    --  Pin/unpin buffer
    ["<leader>bp"] = { "<Cmd>BufferLineTogglePin<CR>", "Pin/Unpin buffer"},
    -- close buffer + hide terminal buffer
    ["<leader>x"] = { "<Cmd>bdelete<CR>", "Close buffer"},
  },
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
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

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    ["<leader>ls"] = {
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

    ["<leader>ra"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    ["<leader>f"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev({ float = { border = "rounded" }})
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next({ float = { border = "rounded" }})
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
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- pick a hidden term
    -- ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope colorscheme <CR>", "theme switcher" },

    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
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