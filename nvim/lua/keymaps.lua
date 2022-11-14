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

-- Moving
-- disable arrow keys cause im learning vim ;)
keymap("n","<Up>","<Nop>",opts)
keymap("n","<Down>","<Nop>",opts)
keymap("n","<Left>","<Nop>",opts)
keymap("n","<Right>","<Nop>",opts)

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

-- Whichkey
local wk = require("which-key")
wk.setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

local mappings = {
    ["<leader>"] = {
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
        -- Configs
        e = {
            c = {':vsplit %<CR>"', "Edit configuration" },
        },
        s = {
            c = {':source %<CR>', "Reload Config" },
        },
        -- nvim-tree
        t ={ ':NvimTreeToggle<cr>', "Toggle NvimTree"},
        r ={ ':NvimTreeRefresh<cr>', "Refresh NvimTree"},
        n ={ ':NvimTreeFindFile<CR>', "Find Files Nvim"},
        b = {":Buffers<CR>","Buffers"}
    },
    -- Telescope
    f = {
        name = 'Telescope',
        f = {'<Cmd>lua require "telescope.builtin".find_files()<CR>', "Find Files"},
        g = {'<Cmd>lua require "telescope.builtin".live_grep()<CR>', "Live Grep"},
        b = {'<Cmd>lua require "telescope.builtin".buffers()<CR>', "Buffers"},
        h = {'<Cmd>lua require "telescope.builtin".help_tags()<CR>', "Help Tags"},
        i = {'<Cmd>lua require "telescope.builtin".git_files()<CR>', "Git Files"},
        t = {'<Cmd>lua require "telescope.builtin".treesitter()<CR>', "Treesitter"},
        o = {'<Cmd>lua require "telescope.builtin".oldfiles()<CR>', "Recent Files"}
    },
    -- Buffers
    ["<tab>"] = { ":BufferLineCycleNext<CR>", "Next Buffer" },
    ["<s-tab>"] = { ":BufferLineCyclePrev<CR>", "Next Buffer" },
    ["<c-n>"] = { ":bnext<CR>", "Next Buffer" },
    ["<c-p>"] = { ":bprevious<CR>", "Next Buffer" },
    -- Window 
    ["<c-w"] = {
        name = "Win",
        -- Split
        x = {":split<CR>", 'Split Horrizontal'},
        v = {":vsplit<CR>", 'Split Vertical'},
        -- to close panel use C-w c
        -- Resize with arrows
        ["<s-j>"] ={":resize -2<CR>",":resize -2<CR>"},
        ["<s-k>"] ={":resize +2<CR>",":resize +2<CR>"},
        ["<s-h>"] ={":vertical resize -2<CR>", ":vertical resize -2<CR>"},
        ["<s-l>"] ={":vertical resize +2<CR>",":vertical resize +2<CR>"},
    }
}

wk.register(mappings, { prefix = '', noremap = true, silent = true })
