" Set standard file encoding
set encoding=utf8

" Number gutter
set number relativenumber


" Set the leader to SPACE
let mapleader="\<SPACE>"

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]

" Open new windows
map <leader>- <C-w>s
map <leader>\ <C-w>v


" Switch betweeen buffered files
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


set timeoutlen=1000 ttimeoutlen=0


" Auto load / install plugin manager

if !1 | finish | endif

" auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    echo "Installing VimPlug..."
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" VimPlug 
call plug#begin('~/.vim/plugged')

" NERDTree
Plug 'scrooloose/nerdtree'

" Vim Tmux Navigator
Plug 'christoomey/vim-tmux-navigator'

" Vim Tmux Resizer
Plug 'melonmanchan/vim-tmux-resizer'

call plug#end()
" Required: Enable filetype plugins
filetype plugin indent on


" Set to auto read when a file is changed from the outside
set autoread

" Open NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Change arrows keys for NERDTREE
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>




let g:tmux_resizer_no_mappings = 1
"
execute "set <M-h>=\eh"
nnoremap <silent> <M-h> :TmuxResizeLeft<cr>

execute "set <M-j>=\ej"
nnoremap <silent> <M-j> :TmuxResizeDown<cr>

execute "set <M-k>=\ek"
nnoremap <silent> <M-k> :TmuxResizeUp<cr>

execute "set <M-l>=\el"
nnoremap <silent> <M-l> :TmuxResizeRight<cr>
