syntax on

" Some good defaults
set expandtab
set guicursor=
set hidden
set incsearch
set nobackup
set noerrorbells
set nohlsearch
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

set clipboard=unnamedplus
" Show commands effects in real time
set inccommand=nosplit
" Maybe set this only for Python: _ counts as a vim word delimiter
" set iskeyword=_
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

" Set leader key to SPACE
nnoremap <SPACE> <Nop>
" let mapleader = "\<SPACE>"
let mapleader = " "

" Lets stop using Escape switch
inoremap jk <Esc>


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Nice colorscheme
Plug 'morhetz/gruvbox'

" Git interface
Plug 'tpope/vim-fugitive'

" LSP plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" fzf for git branches
Plug 'stsewd/fzf-checkout.vim'

" Forgot what this does exactly, maybe not needed
Plug 'sheerun/vim-polyglot'

" Terminal in vim (a bit useless with a good Tmux)
Plug 'voldikss/vim-floaterm'

" Add some good looks (:AirlineToggle to toggle it)
Plug 'vim-airline/vim-airline'
"Plug 'bling/vim-bufferline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '🙉 '
let g:airline#extensions#tabline#left_alt_sep = '🙈 '


" Seamless navigation between vim buffers and tmux panes (must have with Tmux)
Plug 'christoomey/vim-tmux-navigator'

" File manager: explore, move, copy, delete files and folders
" Plug 'scrooloose/nerdtree'

" Fast search keywords
Plug 'mileszs/ack.vim'

" Different colors for intricated [[(({}))]]
Plug 'luochen1990/rainbow'

" Hard to use for now, will check it out later --> lets try the cousin plugin
Plug 'machakann/vim-sandwich'

" camel/snake_case conversions (crs and crc), and more features I should try
Plug 'tpope/vim-abolish'

" camel/snake_case motions
Plug 'bkad/CamelCaseMotion'

" Maximize windows
Plug 'szw/vim-maximizer'

" cheat.sh
Plug 'dbeniamine/cheat.sh-vim'
" Use :HowIn

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" File explorer
Plug 'kyazdani42/nvim-web-devicons' " for file icons <- require a nerd font installed (on your machine)
Plug 'kyazdani42/nvim-tree.lua'
" Next updates:
" vimspector: debugger in vim


" Initialize plugin system
call plug#end()

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

set pyxversion=3

colorscheme gruvbox
set background=dark

set signcolumn=yes:1

" Ignore the third_party directory when searching files
nnoremap <C-p> :GFiles<CR>
if executable('ag')
  let g:ackprg = 'ag --vimgrep --ignore-dir={~/main/tools/third_party}'
endif
" :Ag search only files content
" --nogroup --column --color  --
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nnoremap <C-f> :Ag<CR>
"nnoremap <C-f> :Ack<SPACE>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }


let g:floaterm_keymap_toggle = '<Leader><Leader>'
let g:floaterm_keymap_new = '<Leader>fn'

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle


" map <F2> :NERDTreeToggle<CR>
nnoremap <F2> :NvimTreeToggle<CR>


map <silent> W <Plug>CamelCaseMotion_w
map <silent> B <Plug>CamelCaseMotion_b
sunmap W
sunmap B
omap <silent> iW <Plug>CamelCaseMotion_iw
xmap <silent> iW <Plug>CamelCaseMotion_iw
omap <silent> iB <Plug>CamelCaseMotion_ib
xmap <silent> iB <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie


nnoremap <leader>m :MaximizerToggle!<CR>
" ******* COC SETUP *******
" Python: install python + enable mypy + pip3 install -U jedi
" This should mostly work out of the box, apart for one detail, outside the
" container:
" our own python libs(backend/host/bash and svpy) needs to be added to the Python path for Jedi to find them.
" python.autoComplete.extraPaths
"
" Typescript: instal typescript and typescriptreact plugins w/ CocInstall
" works pretty much out of the box (maybe eslint needs to be installed too)
"
" Cpp: install ccls, then set it up,
" ccls setup is less straight forward:
" https://github.com/MaskRay/ccls/wiki/Project-Setup
" At root of directory create a .ccls file containing:
" %compile_commands.json
" Now, to generate the compile_commands.json: (https://github.com/MaskRay/ccls/wiki/Project-Setup#cmake)
" c(atkin_)make -H. -BDebug -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=YES
" The path used in the compile_commands are from the container, so they might
" not work on the host. To fix it, replace all /home/sv by /home/${user}
"

"let g:coc_global_extensions = ['coc-json', 'coc-git']

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

" Switch betweeen buffered files
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Set to auto read when a file is changed from the outside
set autoread
au CursorHold * checktime

" Open NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" ########### SNIPPETS
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Automatically trim whitespace at EOL when saving
function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

function! Vimrc()
  edit ~/.config/nvim/init.vim
endfun
command! Vimrc :call Vimrc()

function! ListPlug()
  CocList marketplace
endfun
command! ListPlug :call ListPlug()

function! SourceVimrc()
  source ~/.config/nvim/init.vim
endfun
command! SourceVimrc :call SourceVimrc()

function! RelativeNumberToggle()
  if(&rnu == 1)
    set nornu
  else
    set rnu
  endif
endfunc

nnoremap <leader>r :call RelativeNumberToggle()<cr>
" Run command within container
" Build entire catkin ws
"let build_command='catkin_make'
" Build one catkin package
"let pkg =
"let build_command='catkin_make --pkg' + pkg


