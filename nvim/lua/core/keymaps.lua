--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Keymaps
local g = vim.g
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Moving
-- disable arrow keys cause im learning vim ;)
keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Left>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)

--Remap space as <leader>
g.mapleader = " "
g.maplocalleader = " "

-- nvim-tmux-navigation
keymap("n", "<C-h>", '<cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateLeft()<cr>', opts)
keymap("n", "<C-j>", '<cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateDown()<cr>', opts)
keymap("n", "<C-k>", '<cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateUp()<cr>', opts)
keymap("n", "<C-l>", '<cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateRight()<cr>', opts)
keymap("n", "<C-\\>", '<cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateLastActive()<cr>', opts)
keymap("n", "<C-Space>", '<cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateNext()<cr>', opts)

-- Whichkey
local wk = require("which-key")
wk.setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
})

local mappings = {
  ["<leader>"] = {
    -- Configs
    s = {
      e = { ':vsplit %<cr>"', "Edit configuration" },
      r = { ":source %<cr>", "Reload Config" },
    },
    -- nvim-tree
    t = { ":NvimTreeToggle<cr>", "Toggle NvimTree" },
    r = { ":NvimTreeRefresh<cr>", "Refresh NvimTree" },
    n = { ":NvimTreeFindFile<cr>", "Find Files Nvim" },
    b = { ":Buffers<cr>", "Buffers" },
    -- Telescope
    f = {
      name = "Telescope",
      f = { '<cmd>lua require "telescope.builtin".find_files()<cr>', "Find Files" },
      g = { '<cmd>lua require "telescope.builtin".live_grep()<cr>', "Live Grep" },
      b = { '<cmd>lua require "telescope.builtin".buffers()<cr>', "Buffers" },
      h = { '<cmd>lua require "telescope.builtin".help_tags()<cr>', "Help Tags" },
      i = { '<cmd>lua require "telescope.builtin".git_files()<cr>', "Git Files" },
      t = { '<cmd>lua require "telescope.builtin".treesitter()<cr>', "Treesitter" },
      r = { '<cmd>lua require "telescope.builtin".oldfiles()<cr>', "Recent Files" },
      --- :Telescope LSP --
      l = {
        name = "+Lsp",
        -- if vim.fn.exists(':Telescope') then
        r = { '<cmd>lua require "telescope.builtin".lsp_references()<cr>', "Lsp references" },
        d = { '<cmd>lua require "telescope.builtin".lsp_definitions()<cr>', "Lsp definitions" },
        i = { '<cmd>lua require "telescope.builtin".lsp_implementations()<cr>', "Lsp implementations" },
        t = { '<cmd>lua require "telescope.builtin".lsp_type_definitions()<cr>', "Lsp type_definition" },
      },
    },
    --- Lspsaga --
    l = {
      name = "+Lspsaga",
      c = { "<cmd>Lspsaga code_action<cr>", "Code actions" },
      d = { "<cmd>Lspsaga peek_definition<cr>", "Line diagnostic" },
      f = { "<cmd>Lspsaga lsp_finder<cr>", "Lsf Finder" },
      s = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "Show Cursor Diagnostics" },
      S = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics" },
      n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Go To Next Diagnostic" },
      N = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Go To Previous Diagnostic" },
      K = { "<cmd>Lspsaga hover_doc<cr>", "Lsp - Hover" },
      R = { "<cmd>Lspsaga rename<cr>", "Rename" },
      o = { "<cmd>LSoutlineToggle<cr>", "Outline" },
    },
    --- Trouble --
    x = {
      name = "+Trouble",
      x = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
      w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
      d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Doc diagnostics" },
      l = { "<cmd>TroubleToggle loclist<cr>", "Loc list" },
      q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
      R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
    },
    -- Harpoon --
    -- nnoremap("<C-h>", function() require("harpoon.ui").nav_file(1) end, silent)
    a = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Harpoon mark file",
    },
  },
  --- LSP --
  g = {
    name = "Lsp",
    d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition" }, -- or or <cmd>Lspsaga peek_definition<cr> -- <C-o> go back
    r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" }, -- or  <cmd>Lspsaga rename<cr>
    i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "See implementation" },
    t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type definition" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to declaration" },
    R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" }, -- or <cmd>Lspsaga rename<cr>
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code actions" },
    p = { "<cmd>Lspsaga peek_definition<cr>", "Lspsaga Preview def" },
    f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format File" },
  },
  K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Lsp - Hover" }, -- or <cmd>Lspsaga hover_doc<cr>

  --- Lspsaga --
  ["]d"] = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Go to next diagnostic" },
  ["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Go to previous diagnostic" },
  ["]e"] = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Go To Next Diagnostic" },
  ["]e"] = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Go To Previous Diagnostic" },
  -- Open Floaterm
  ["<A-g>"] = { "<cmd>Lspsaga open_floaterm lazygit<cr>", "Open Lazy Git" },

  -- Buffers
  ["<tab>"] = { ":bnext<cr>", "Next Buffer" }, -- or <c-^
  ["<s-tab>"] = { ":bprevious<cr>", "Previous Buffer" },

  -- Select All
  ["<c-a>"] = { "gg<S-v>G", "Select All" },

  ["<c-e>"] = {
    function()
      require("harpoon.ui").toggle_quick_menu()
    end,
    "Harpoon Toogle Menu",
  },

  -- Window
  ["<c-w>"] = {
    name = "+Window",

    -- Split
    s = { ":split<cr>", "Split Horrizontal" },
    v = { ":vsplit<cr>", "Split Vertical" },
    c = { ":close<cr>", "Close Split" },
    n = { "<C-w>n", "Blank split -h " },
    q = { "<C-w>q", "Close this pane" },
    o = { "<C-w>o", "Close other panes" },
    r = { "<C-w>r", "Rotate Pane" },
    x = { "<C-w>x", "exchange current window with next one" },

    -- Resize
    j = { ":resize -2<cr>", ":resize -2<cr>" },
    k = { ":resize +2<cr>", ":resize +2<cr>" },
    h = { ":vertical resize -2<cr>", ":vertical resize -2<cr>" },
    l = { ":vertical resize +2<cr>", ":vertical resize +2<cr>" },
  },
}

wk.register(mappings)

-- Close Lspsaga Floaterm
wk.register({
  ["<A-g>"] = { "[[<C-\\><C-n><cmd>Lspsaga close_floaterm<CR>]]", "Open Lazy Git" }, -- Floaterm
}, { mode = "t", silent = true })
