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
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
au BufNewFile,BufRead *.ts setlocal filetype=typescript
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


" Plugins {{{
" ---------------------------------------------------------------------
if has("nvim")
    let g:plug_home = stdpath('data') . '/plugged'
endif
call plug#begin()
" PlugInstall PlugClean PlugUpdate

" Visual / Themes
Plug 'itchyny/lightline.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'ryanoasis/vim-devicons'

" Navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Editing
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'thaerkh/vim-indentguides'

" Behaviour/tools
Plug 'sheerun/vim-polyglot'
Plug 'wakatime/vim-wakatime'

" Auto-completion

" Git

if has("nvim")
" Language Server Protocol

" File Management
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'nvim-telescope/telescope-file-browser.nvim'
" Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'kyazdani42/nvim-tree.lua'
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
let mapleader="\<Space>"

nnoremap <leader>ec :vsplit %<CR>
nnoremap <leader>sc :source %<CR>
nnoremap <silent><leader>b :Buffers<CR>
nnoremap <F1> :bprevious<CR>
nnoremap <F2> :bnext<CR>
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

nnoremap <c-p> :Files<CR>
nnoremap <c-f> :Ag<CR>

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

"[Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" fzf }}}


" lightline {{{
let g:lightline = {
    \ 'active': {
    \   'left':  [ [ 'mode', 'paste' ],
    \              [ 'readonly', 'relativepath', 'percent', 'modified' ],
    \            ],
    \   'right': [ [ ],
    \              [ 'filetype' ],
    \              [ 'tagbar' ] ]
    \   },
    \ 'component_function': {
    \   'filetype': 'MyFiletype',
    \   'fileformat': 'MyFileformat',
    \   'gitbranch': 'fugitive#head',
    \   'bufferinfo': 'lightline#buffer#bufferinfo',
    \ },
    \ 'tab': {
    \   'active': [ 'filename', 'modified' ],
    \   'inactive': [ 'filename', 'modified' ],
    \ },
    \ 'tabline': {
    \   'left': [ [ 'tabs' ] ],
    \   'right': [ [ 'gitbranch' ] ],
    \ },
    \ 'component_expand': {
    \   'buffercurrent': 'lightline#buffer#buffercurrent',
    \   'bufferbefore': 'lightline#buffer#bufferbefore',
    \   'bufferafter': 'lightline#buffer#bufferafter',
    \ },
    \ 'component_type': {
    \   'buffercurrent': 'tabsel',
    \   'bufferbefore': 'raw',
    \   'bufferafter': 'raw',
    \ },
    \ 'component': {
    \   'separator': '',
    \   'tagbar': '%{tagbar#currenttag("%s", "", "f")}',
    \ },
    \ }

function! MyFiletype() abort
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat() abort
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" Use auocmd to force lightline update when coc.nvim status changes.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

"""" lightline-buffer
set showtabline=2  " always show tabline

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = ''
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = '  '
 
" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 0
let g:lightline_buffer_rotate = 0
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']
 
let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20
" lightline }}}
 
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

" lightline
let g:lightline = {'colorscheme': 'tokyonight'}
" tokyonight theme }}}

" vim-tmux-navigator }}}
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" vim-tmux-navigator {{{

" nvim-treesitter {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'html', 'javascript', 'typescript', 'tsx', 'css','json' },
    -- ensure_installed = "all", -- or maintained
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
    },
    indent = {
        enable = false
    },
    context_commentstring = {
        enable = true
    }
}
EOF
" }}}

" yazdani42/nvim-tree.lua {{{
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_gitignore = 1
"let g:nvim_tree_auto_close = 1
"let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ]
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_group_empty = 1
"let g:nvim_tree_lsp_diagnostics = 1

lua << EOF
require'nvim-tree'.setup {
    auto_close = true,
    -- lsp_diagnostics = true,
    ignore_ft_on_setup  = { 'startify', 'dashboard' },
}
EOF

nnoremap <C-t> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" yazdani42/nvim-tree.lua }}}
"

" Indentguides }}}
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
" Indentguides {{{
