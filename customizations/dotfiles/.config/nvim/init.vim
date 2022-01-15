" Sets {{{
" ---------------------------------------------------------------------
set exrc
set relativenumber
set nu
set hlsearch
set mouse=a
set hidden
set splitright
set splitbelow
set noerrorbells
set nowrap
set formatoptions-=t
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=2
set noshowmode
set completeopt=menu,menuone,noselect
set signcolumn=yes
set number
set updatetime=50
set encoding=UTF-8
set clipboard+=unnamedplus " Copy paste between vim and everything else
set nojoinspaces " don't autoinsert two spaces after '.', '?', '!' for join command
set showcmd " extra info at end of command line
set wildignore+=*/node_modules/**
filetype plugin indent on


" folding

" attempt to speed-up vim
set ttyfast
set lazyredraw

" for demo

set tabstop=4                  " ┐
set softtabstop=4              " │ Set global <TAB> settings
set shiftwidth=4               " │ http://vimcasts.org/e/2
set expandtab                  " ┘


" Sets }}}

" File types {{{
"---------------------------------------------------------------------
" JavaScript, Typescript
autocmd BufNewFile,BufRead *.es6 set filetype=javascript
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
" Fish
au BufNewFile,BufRead *.fish set filetype=fish

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

" autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
" autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
" autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" }}}

" for test Ale + Coc {{{
let g:ale_disable_lsp = 1
" for test Ale + Coc }}}

" Plugins {{{
" ---------------------------------------------------------------------
if has("nvim")
    let g:plug_home = stdpath('data') . '/plugged'
endif
call plug#begin()
" PlugInstall PlugClean PlugUpdate

" Visual / Themes
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }


" Navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Editing
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'thaerkh/vim-indentguides'
Plug 'vim-scripts/tComment'   "Comment easily with gcc

" Behaviour/tools
Plug 'wakatime/vim-wakatime'

" Auto-completion / Prettier
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'

Plug 'dense-analysis/ale'
"Plug 'maximbaz/lightline-ale'

""" JS,Typescript
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
"Plug 'maxmellon/vim-jsx-pretty'  " don't need with vim-polyglot
Plug 'peitalin/vim-jsx-typescript'
Plug 'justinj/vim-react-snippets'
Plug 'honza/vim-snippets'

Plug 'styled-components/vim-styled-components', {'branch': 'main'}
Plug 'jparise/vim-graphql'        " GraphQL syntax

"""" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git
"Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'



if has("nvim")
" Language Server Protocol

" File Management
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
" Plug 'sudormrfbin/cheatsheet.nvim'
" Plug 'ThePrimeagen/harpoon'

" Visual / Themes
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Navigation
" Editing
" Behaviour/tools
" Auto-completion
" Git
endif

call plug#end()

" Plugins }}}

" Keybindings {{{
" ---------------------------------------------------------------------
" disable arrow keys cause im NOOB
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

let mapleader="\<Space>"

nnoremap <leader>ec :vsplit %<CR>
nnoremap <leader>sc :source %<CR>
noremap <C-w>x :split<cr>
noremap <C-w>v :vsplit<cr>

" to close panel use C-w c
" to change tab use gt ou gT

" Keybindings }}}

" fzf {{{
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
let g:fzf_preview_window = []

let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

nnoremap <silent><leader>b :Buffers<CR>
nnoremap <silent><leader>fi :Files<CR>
nnoremap <silent><leader>ag :Ag<CR>
" nnoremap <silent><leader>rg :Rg<CR>
nnoremap <silent><leader>h: :History<CR>

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

"[Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" fzf }}}

" nvim-lualine/lualine.nvim {{{
lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'horizon',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
END

" nvim-lualine/lualine.nvim }}}

" akinsho/bufferline.nvim {{{
lua << EOF
require("bufferline").setup{}
EOF



" akinsho/bufferline.nvim }}}
"
" tokyonight theme {{{
let g:tokyonight_style = "night" " storm, night or day
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

" Change the hint color to the 'orange' color, and make the 'error' color bright red
let g:tokyonight_colors = {
    \ 'hint': 'orange',
    \ 'error': '#ff0000'
    \ }

" Load the colorscheme
colorscheme tokyonight

" tokyonight theme }}}

" vim-tmux-navigator }}}
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" vim-tmux-navigator {{{

" nvim-treesitter/nvim-treesitter {{{
" nvim-treesitter/nvim-treesitter :}}}


" yazdani42/nvim-tree.lua {{{

let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 0 "1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'notify',
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

highlight NvimTreeFolderIcon guibg=blue

nnoremap <C-t> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
lua << EOF
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}

EOF



" yazdani42/nvim-tree.lua }}}


" Indentguides }}}
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
" Indentguides {{{

" CoC Configs {{{
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-tslint-plugin',
    \ 'coc-prettier',
    \ 'coc-emmet',
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-eslint',
    \ 'coc-yank',
    \ 'coc-blade',
    \ 'coc-json'
    \ ]

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
    let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
    let g:coc_global_extensions += ['coc-eslint']
endif

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>do <Plug>(coc-codeaction)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
" CoC Configs }}}

" dense-analysis/ale {{{
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END
nnoremap <leader>af :ALEFix<cr>

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \   'javascript': ['prettier', 'eslint'],
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \}
let g:ale_linters = {
    \   'javascript': ['eslint'],
    \}
" dense-analysis/ale }}}

" pangloss/vim-javascript {{{
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
" pangloss/vim-javascript }}}

" peitalin/vim-jsx-typescript {{{
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
" peitalin/vim-jsx-typescript }}}

" nvim-telescope/telescope.nvim {{{
nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>
" nvim-telescope/telescope.nvim }}}
