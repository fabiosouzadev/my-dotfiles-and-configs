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
keymap("n", "<C-h>", '<Cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateLeft()<CR>', opts)
keymap("n", "<C-j>", '<Cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateDown()<CR>', opts)
keymap("n", "<C-k>", '<Cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateUp()<CR>', opts)
keymap("n", "<C-l>", '<Cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateRight()<CR>', opts)
keymap("n", "<C-\\>", '<Cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateLastActive()<CR>', opts)
keymap("n", "<C-Space>", '<Cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateNext()<CR>', opts)

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
    e = {
      c = { ':vsplit %<CR>"', "Edit configuration" },
    },
    s = {
      c = { ":source %<CR>", "Reload Config" },
    },
    -- nvim-tree
    t = { ":NvimTreeToggle<cr>", "Toggle NvimTree" },
    r = { ":NvimTreeRefresh<cr>", "Refresh NvimTree" },
    n = { ":NvimTreeFindFile<CR>", "Find Files Nvim" },
    b = { ":Buffers<CR>", "Buffers" },

    --- LSP --
    l = {
      name = "+Lspsaga",
      c = { "<cmd>Lspsaga code_action<CR>", "Code actions" },
      d = { "<cmd>Lspsaga peek_definition<CR>", "Line diagnostic" },
      f = { "<cmd>Lspsaga lsp_finder<CR>", "Lsf Finder" },
      e = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics" },
      n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Go To Next Diagnostic" },
      N = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Go To Previous Diagnostic" },
      K = { "<cmd>Lspsaga hover_doc<cr>", "Lsp - Hover" },
      R = { "<cmd>Lspsaga rename<CR>", "Rename" },
    },
    --- LSP --
  },
  --- LSP --
  g = {
    name = "Lsp",
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" }, -- or or <cmd>Lspsaga peek_definition<CR> -- <C-o> go back
    D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
    r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" }, -- or  <Cmd>Lspsaga rename<CR>
    t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition" },
    i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "See implementation" },
    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code actions" },
    p = { "<Cmd>Lspsaga peek_definition<CR>", "Lspsaga Preview def" },
    f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format File" },
    R = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" }, -- or <cmd>Lspsaga rename<cr>
  },
  K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Lsp - Hover" }, -- or <Cmd>Lspsaga hover_doc<CR>
  ["]d"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Go to next diagnostic" },
  ["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Go to previous diagnostic" },
  --- LSP --

  -- Telescope
  f = {
    name = "Telescope",
    f = { '<Cmd>lua require "telescope.builtin".find_files()<CR>', "Find Files" },
    g = { '<Cmd>lua require "telescope.builtin".live_grep()<CR>', "Live Grep" },
    b = { '<Cmd>lua require "telescope.builtin".buffers()<CR>', "Buffers" },
    h = { '<Cmd>lua require "telescope.builtin".help_tags()<CR>', "Help Tags" },
    i = { '<Cmd>lua require "telescope.builtin".git_files()<CR>', "Git Files" },
    t = { '<Cmd>lua require "telescope.builtin".treesitter()<CR>', "Treesitter" },
    o = { '<Cmd>lua require "telescope.builtin".oldfiles()<CR>', "Recent Files" },
  },
  -- Window
  s = {
    name = "Window",
    -- Split
    x = { ":split<CR>", "Split Horrizontal" },
    v = { ":vsplit<CR>", "Split Vertical" },
    c = { ":close<CR>", "Close Split" },
    q = { ":cclose<CR>", "Close gr pane" },
    -- Resize
    j = { ":resize -2<CR>", ":resize -2<CR>" },
    k = { ":resize +2<CR>", ":resize +2<CR>" },
    h = { ":vertical resize -2<CR>", ":vertical resize -2<CR>" },
    l = { ":vertical resize +2<CR>", ":vertical resize +2<CR>" },
  },
  -- Buffers
  ["<tab>"] = { ":bnext<cr>", "Next Buffer" },
  ["<s-tab>"] = { ":bprevious<cr>", "Previous Buffer" },
  -- Select All
  ["<c-a>"] = { "gg<S-v>G", "Select All" },
}

wk.register(mappings, { prefix = "", noremap = true, silent = true })
