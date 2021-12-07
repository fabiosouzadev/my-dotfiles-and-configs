call plug#begin()

Plug 'terryma/vim-multiple-cursors'
Plug 'ryanoasis/vim-devicons'
Plug 'ghifarit53/tokyonight-vim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

set hidden
set number
set relativenumber
set nocompatible

let mapleader="\<space>"
nnoremap <leader>; A;<esc>
nnoremap <leader>ec :vsplit ~/.vimrc<CR>
nnoremap <leader>sc :source ~/.vimrc \| :PlugInstall<CR>

" Source Vim configuration file and install plugins
" nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>
nnoremap <silent><leader>b :Buffers<CR>

nnoremap <c-p> :Files<CR>
nnoremap <c-f> :Ag<CR>

set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight


" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" tagbar
nmap <F8> :TagbarToggle<CR>

let g:lightline = {
      \ 'colorscheme': 'embark',
      \ }
let g:embark_terminal_italics = 1
" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
let g:fzf_preview_window = []

