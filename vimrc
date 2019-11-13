" Set standard file encoding
set encoding=utf8

" Number gutter
set number relativenumber

" auto paste
set paste

" set default register to clipboard
set clipboard=unnamedplus

" Auto Folding
set foldmethod=syntax

" Ctags completion
set autochdir
set tags=./tags;tags

" Set the leader to SPACE
let mapleader="\<SPACE>"

" Highlight search results
set hlsearch

set ruler

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

" Fix stupid issue with Alt key
" Actually this fucks up the macro recording Esc key
"let c='h'
"exec "set <A-".c.">=\e".c
"exec "imap \e".c." <A-".c.">"
"let c='j'
"exec "set <A-".c.">=\e".c
"exec "imap \e".c." <A-".c.">"
"let c='k'
"exec "set <A-".c.">=\e".c
"exec "imap \e".c." <A-".c.">"
"let c='l'
"exec "set <A-".c.">=\e".c
"exec "imap \e".c." <A-".c.">"


" Resize splits
nnoremap <A-h> :resize -1
nnoremap <A-j> :vertical resize +1
nnoremap <A-k> :vertical resize -1
nnoremap <A-l> :resize +1



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
" Use PlugUpdate to update Plugins
call plug#begin('~/.vim/plugged')

" vim-javascript : better javascript highlighting and stuff
Plug 'pangloss/vim-javascript'
" I want JSX too
Plug 'mxw/vim-jsx'

" Unite
Plug 'Shougo/unite.vim'

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

" For html/xml stuff
Plug 'alvan/vim-closetag'

" Tab and status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Fuzzy Finder
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }

" Typescript highlighting
Plug 'leafgarland/typescript-vim'

" Sneak : use Sxy to move to xy
Plug 'justinmk/vim-sneak'

" clang_complete
Plug 'Rip-Rip/clang_complete'
let g:clang_library_path='/usr/lib/x86_64-linux-gnu/libclang-8.so'

" Cpp enhanced highlight
Plug 'octol/vim-cpp-enhanced-highlight'

" Panes swapper
" Use: <leader>ww on each window to swap them
Plug 'wesQ3/vim-windowswap'

call plug#end()

" Required: Enable filetype plugins
filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert spaces
set expandtab


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

" Load completion for command mode
set runtimepath^=~/.vim.scripts/SearchComplete.vim

" Sneak settings (same as f)
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

" Zoom / Restore window. " Map to 2xLeader
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <Leader><Leader> :ZoomToggle<CR> 


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
" colorscheme DevC++
colorscheme dracula 
