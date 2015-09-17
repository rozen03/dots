set nocompatible

set number	" Show line numbers
set relativenumber
set linebreak	" Break lines at word (requires Wrap lines)
set showmatch	" jighlight matching brace
set visualbell	" Use visual bell (no beeping)
set autoread
set showmode
set history=1000
set showcmd
set browsedir=buffer
set wildmenu    " Show command autocomplete in a menu
set clipboard=unnamed
inoremap ., <Esc>

" ================ Search ===========================

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set incsearch	" Searches for strings incrementally

" ================ Indentation ======================

set autoindent	" Auto-indent new lines
set expandtab	" Use spaces instead of tabs
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" =============== Colors ============================
set t_Co=256
colorscheme monokai

" =============== Advanced ==========================
set ruler	" Show row and column ruler information

set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

syntax on

" ================ Scrolling ========================
set scrolloff=8 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Keys =============================

" Use ctrl-[hjkl] to select the active split!
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
" Neovim workaround
nnoremap <silent> <BS> :wincmd h<CR>

" I keep doing this >.<
command W w

" ================ Directories ======================
set backup
silent !mkdir ~/.vim/backups/back/ > /dev/null 2>&1
set backupdir=~/.vim/backups/back/
silent !mkdir ~/.vim/backups/swp/ > /dev/null 2>&1
set dir=~/.vim/backups/swp/

" Persistent Undo
if has('persistent_undo')
    silent !mkdir ~/.vim/backups/undo/ > /dev/null 2>&1
    set undodir=~/.vim/backups/undo/
    set undofile
    endif

" ================ Plugins ==========================
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe', {'do': './install.sh --clang-completer --omnisharp-completer'}
Plug '~/.vim/plugin/autoclose.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

if has('nvim')
    Plug 'jalvesaq/Nvim-R'
else
    Plug 'vim-scripts/Vim-R-plugin'
endif

call plug#end()

" ================ YouCompleteMe ====================
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" ================ GitGutter ========================
let g:gitgutter_updatetime = 750

" ================ Vimtex ===========================
let g:tex_flavor = 'latex'

" ================ NERDTree =========================
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

