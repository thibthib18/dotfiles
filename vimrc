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

" Search results appear in the middle of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

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

" A lot of colorschemes
Plug 'flazz/vim-colorschemes'

" Dracula theme, maybe again
Plug 'dracula/vim'

" Tab and status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Fuzzy Finder
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }

" Sneak
Plug 'justinmk/vim-sneak'

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

" Set status from vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2

" CtrlP settings
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>t :CtrlP<CR>

" Sneak settings
" f <key> to jump to next <key>
" F <key> to jump to previous <key>
" f to following match
" s <key><key> to jump to next <key><key>
" S <key><key> to jump to previous <key><key>
" s to following match

let g:sneak#s_next = 1
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F




" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Colorscheme
colorscheme dracula 

