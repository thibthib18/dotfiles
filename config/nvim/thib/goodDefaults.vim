syntax on

" Some good defaults
set expandtab
set guicursor=
set hidden
set incsearch
set nobackup
set noerrorbells
set noshowmatch
set noshowmode
set noswapfile
set nu
set relativenumber
set scrolloff=8
set shiftwidth=2
set smartcase
set smartindent
set tabstop=2 softtabstop=2
set termguicolors
set undodir=~/.vim/undodir
set undofile
set wrap

" Folds
" use syntax or indent
set foldmethod=indent
set foldlevel=1
set foldclose=all

set clipboard=unnamedplus

" Show commands effects in real time
set inccommand=nosplit

" For those who do not know the keys
set mouse=a

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50
set timeoutlen=400

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=120

let loaded_matchparen = 1

" Set to auto read when a file is changed from the outside
set autoread
au CursorHold * checktime

