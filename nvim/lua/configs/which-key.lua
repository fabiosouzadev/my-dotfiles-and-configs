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

-- Whichkey
local wk = require("which-key")
wk.setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
}

local mappings = {
    l = {
        name = "Lsp",
        i = {":LspInfo<cr>", "Connected Language Servers"},
        I = {'<cmd>LspInstallInfo<cr>', 'Install language server'},
        k = {'<cmd>lua vim.lsp.buf.signature_help()<CR>', "Signature help"},
        K = {'<cmd>lua vim.lsp.buf.hover()<CR>', "Hover"},
        w = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', "Add workspace folder"},
        W = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', "Remove workspace folder"},
        l = {
          '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
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
            name = 'Lspsaga',
            R = {'<cmd>Lspsaga rename<cr>', "Rename"},
            a = {'<cmd>Lspsaga code_action<cr>', "Code Action"},
            e = {'<cmd>Lspsaga show_line_diagnostics<cr>', "Show Line Diagnostics"},
            n = {'<cmd>Lspsaga diagnostic_jump_next<cr>', "Go To Next Diagnostic"},
            N = {'<cmd>Lspsaga diagnostic_jump_prev<cr>', "Go To Previous Diagnostic"}
        },
    },
    TAB = { ":BufferLineCycleNext<CR>", "Next Buffer" },
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

wk.register(mappings, { prefix = ''})
wk.register(l_mappings, { prefix = '<leader>'})
