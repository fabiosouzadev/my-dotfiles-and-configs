-- https://github.com/ChristianChiarulli/nvim/blob/master/lua/user/keymaps.lua

-- Keymaps
local g = vim.g

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
g.mapleader = " "
g.maplocalleader = " "



-- Para Salvar com 'Ctrl + S' nos modos: Normal, Inserção e Visual
-- Precisa adicionar a linha: stty -ixon , ao seu ~/.bashrc
vim.cmd([[ nnoremap <C-s> :w<CR> ]])
vim.cmd([[ inoremap <C-s> <Esc>:w<CR>l ]])
vim.cmd([[ vnoremap <C-s> <Esc>:w<CR> ]])
-- Selecionar tudo com 'Ctrl + A'
vim.cmd([[ map <C-a> ggVG ]])

-- Edit and Reload Config
keymap("n","<leader>ec",":vsplit %<CR>",opts)
keymap("n","<leader>sc",":source %<CR>",opts)

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

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

---
-- Plugins Keymaps
---

-- nvim-tree
keymap("n", "<leader>t", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)
keymap("n", "<leader>n", ":NvimTreeFindFile<CR>", opts)

-- Telescope
keymap("n", '<leader>ff',  '<Cmd>lua require "telescope.builtin".find_files()<CR>', opts)
keymap("n", '<leader>fl',  '<Cmd>lua require "telescope.builtin".live_grep()<CR>', opts)
keymap("n", '<leader>fh', '<Cmd>lua require "telescope.builtin".help_tags()<CR>', opts)
keymap("n", '<leader>fb', '<Cmd>lua require "telescope.builtin".buffers()<CR>',opts)
keymap("n", '<leader>fg',  '<Cmd>lua require "telescope.builtin".git_files()<CR>', opts)
keymap("n", '<leader>ft',  '<Cmd>lua require "telescope.builtin".treesitter()<CR>', opts)

-- Fzf
-- nnoremap <c-p> :Files<CR>
-- nnoremap <c-f> :Ag<CR>

keymap("n", '<C-p>',  ':Files<CR>',opts)
keymap("n", '<leader>ag', ':Ag<CR>',opts)
keymap("n", '<leader>rg', ':Rg<CR>',opts)
keymap("n", '<leader>b', ':Buffers<CR>',opts)
keymap("n", '<leader>h', ':History<CR>',opts)
-- keymap("n", '<leader>tg', ':Tags<CR>',opts)
keymap("n", '<leader>l', ':Lines<CR>',opts)


-- Bufferline

keymap("n", '<Tab>',  ':BufferLineCycleNext<CR>', opts)
keymap("n", '<S-Tab>',  ':BufferLineCycleNext<CR>', opts)

