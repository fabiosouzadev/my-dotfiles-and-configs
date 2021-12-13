call plug#begin()

Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'wakatime/vim-wakatime'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'christoomey/vim-tmux-navigator'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale' " Analisador de codigo assincrono
Plug 'cohama/lexima.vim'  "Auto-pairs  
Plug 'thaerkh/vim-indentguides'
call plug#end()

set number
set relativenumber
set encoding=UTF-8
set autoindent
filetype plugin indent on
syntax enable


let mapleader="\<space>"
nnoremap <leader>ec :vsplit $MYVIMRC<cr>
nnoremap <leader>sc :source $MYVIMRC<CR>
nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>
nnoremap <silent><leader>b :Buffers<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <F1> :bprevious<CR>
nnoremap <F2> :bnext<CR>

" airline
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1

" fzf
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
let g:fzf_preview_window = []

" tokionight theme
set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-z>'
let g:multi_cursor_select_all_word_key = '<A-z>'
let g:multi_cursor_start_key           = 'g<C-z>'
let g:multi_cursor_select_all_key      = 'g<A-z>'
let g:multi_cursor_next_key            = '<C-z>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" Configurações do CoC.nvim
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

" Fim das configurações do CoC.nvim

" Indentguides
let g:indentguides_spacechar = '|'
let g:indentguides_tabchar = '|'

