--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
-- n, v, i, t = mode names
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

M.barbar = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<tab>"] = { "<Cmd>BufferNext<CR>", "Goto next buffer"},
    ["<S-tab>"] = { "<Cmd>BufferPrevious<CR>", "Goto prev buffer"},
     -- cycle through buffers
     ["<leader>."] = { "<Cmd>BufferMoveNext<CR>", "Move buffer forward"},
     ["<leader>,"] = { "<Cmd>BufferMovePrevious<CR>", "Move buffer back"},
    -- close buffer + hide terminal buffer
    ["<leader>x"] = { "<Cmd>BufferClose<CR>", "Close buffer"},
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
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    -- ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

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