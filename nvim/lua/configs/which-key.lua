-- Modes
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

--Remap space as <leader>
keymap("", "<Space>", "<Nop>", opts)
g.mapleader = " "
g.maplocalleader = " "


-- nvim-tmux-navigation
keymap("n", "<C-h>", '<Cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateLeft()<CR>',opts)
keymap("n", "<C-j>", '<Cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateDown()<CR>',opts)
keymap("n", "<C-k>", '<Cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateUp()<CR>',opts)
keymap("n", "<C-l>", '<Cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateRight()<CR>',opts)
keymap("n", "<C-\\>", '<Cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateLastActive()<CR>',opts)
keymap("n", "<C-Space>", '<Cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateNext()<CR>',opts)

-- Selecionar tudo com 'Ctrl + A'
vim.cmd([[ map <C-a> ggVG ]])

-- Moving
-- disable arrow keys cause im learning vim ;)
keymap("n","<Up>","<Nop>",opts)
keymap("n","<Down>","<Nop>",opts)
keymap("n","<Left>","<Nop>",opts)
keymap("n","<Right>","<Nop>",opts)

-- Split
keymap("n","<C-w>x",":split<CR>",opts)
keymap("n","<C-w>v",":vsplit<CR>",opts)
-- to close panel use C-w c

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-w><S-j>", ":resize -2<CR>", opts)
keymap("n", "<C-w><S-k>", ":resize +2<CR>", opts)
keymap("n", "<C-w><S-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-w><S-l>", ":vertical resize +2<CR>", opts)

-- Naviagate buffers
keymap("n", "<leader>b", ":Buffers<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- nvim-tree
keymap("n", "<leader>t", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)
keymap("n", "<leader>n", ":NvimTreeFindFile<CR>", opts)

-- FZF - lua
keymap("n", '<C-p>',  '<Cmd>lua require("fzf-lua").files()<CR>',opts)
keymap("n", '<leader>ag', '<Cmd>lua require("fzf-lua").live_grep()<CR>',opts)
keymap("n", '<leader>rg', '<Cmd>lua require("fzf-lua").grep_project()<CR>',opts)
keymap("n", '<leader>b', '<Cmd>lua require("fzf-lua").buffers()<CR>',opts)
keymap("n", '<leader>h', '<Cmd>lua require("fzf-lua").search_history()<CR>',opts)
-- keymap("n", '<leader>tg', ':Tags<CR>',opts)
keymap("n", '<leader>l', '<Cmd>lua require("fzf-lua").lines()<CR>',opts)

-- Whichkey
local wk = require("which-key")
wk.setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

local mappings = {
    l = {
        name = "+Lsp",
        i = {":LspInfo<cr>", "Connected Language Servers"},
        I = {'<cmd>LspInstallInfo<cr>', 'Install language server'},
        k = {'<cmd>lua vim.lsp.buf.signature_help()<cr>', "Signature help"},
        K = {'<cmd>lua vim.lsp.buf.hover()<cr>', "Hover"},
        w = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', "Add workspace folder"},
        W = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', "Remove workspace folder"},
        l = {
          '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>',
          "List workspace folder"
        },
        t = {'<cmd>lua vim.lsp.buf.type_definition()<CR>', "Type definition"},
        d = {'<cmd>lua vim.lsp.buf.definition()<CR>', "Go to definition"},
        D = {'<cmd>lua vim.lsp.buf.declaration()<CR>', "Go to declaration"},
        r = {'<cmd>lua vim.lsp.buf.references()<CR>', "References"},
        R = {'<cmd>lua vim.lsp.buf.rename()<CR>', "Rename"},
        a = {'<cmd>lua vim.lsp.buf.code_action()<CR>', "Code actions"},
        e = {'<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', "Show line diagnostics"},
        n = {'<cmd>lua vim.diagnostic.goto_next()<CR>', "Go to next diagnostic"},
        N = {'<cmd>lua vim.diagnostic.goto_prev()<CR>', "Go to previous diagnostic"},
        f = {'<cmd>lua vim.lsp.buf.formatting()<CR>', "Format File"},
        T = {'<cmd> Telescope diagnostics bufnr=0<CR>', "Get Diagnostics"},
        s = {
            name = '+Lspsaga',
            R = {'<cmd>Lspsaga rename<cr>', "Rename"},
            a = {'<cmd>Lspsaga code_action<cr>', "Code Action"},
            e = {'<cmd>Lspsaga show_line_diagnostics<cr>', "Show Line Diagnostics"},
            n = {'<cmd>Lspsaga diagnostic_jump_next<cr>', "Go To Next Diagnostic"},
            N = {'<cmd>Lspsaga diagnostic_jump_prev<cr>', "Go To Previous Diagnostic"}
        },
    },
    -- not working
    ["<tab>"] = { ":BufferLineCycleNext<CR>", "Next Buffer" },
    ["<s-tab>"] = { ":BufferLineCyclePrev<CR>", "Next Buffer" },
}

local l_mappings = {
    e = {
        c = {':vsplit %<CR>"', "Edit configuration" },
    },
    s = {
        c = {':source %<CR>', "Reload Config" },
    },
    -- Telescope
    f = {
        name = 'Telescope',
        f = {'<Cmd>lua require "telescope.builtin".find_files()<CR>', "Find Files"},
        l = {'<Cmd>lua require "telescope.builtin".live_grep()<CR>', "Live Grep"},
        h = {'<Cmd>lua require "telescope.builtin".help_tags()<CR>', "Help Tags"},
        b = {'<Cmd>lua require "telescope.builtin".buffers()<CR>', "Buffers"},
        g = {'<Cmd>lua require "telescope.builtin".git_files()<CR>', "Git Files"},
        t = {'<Cmd>lua require "telescope.builtin".treesitter()<CR>', "Treesitter"},
        o = {'<Cmd>lua require "telescope.builtin".oldfiles()<CR>', "Recent Files"}
    }
}

wk.register(mappings, { prefix = '', noremap = true, silent = true })
wk.register(l_mappings, { prefix = '<leader>', noremap = true, silent = true })
