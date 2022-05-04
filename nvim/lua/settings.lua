local opt = vim.opt
local o = vim.o

-- General
opt.compatible = false
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.swapfile = false
opt.undodir = vim.fn.stdpath('data') .. '/undodir'
opt.backup = false
opt.showmode = false
opt.hidden = true
opt.history = 100
opt.lazyredraw = true
opt.ttyfast = true
opt.synmaxcol = 240
opt.errorbells = false
opt.showcmd = true
opt.wildignore:append {'*/node_modules/**'}

-- Editor
opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.scrolloff=2
opt.showmode = false
--  opt.signcolumn = 'yes'
opt.splitright = true
opt.splitbelow = true

-- Set the behavior of tab
opt.tabstop=2              
opt.softtabstop=2         
opt.shiftwidth=2             
opt.expandtab=true

-- Themes
opt.termguicolors = true


vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

