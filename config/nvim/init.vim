source /home/sv/dotfiles/config/nvim/thib/goodDefaults.vim

" Set leader key to SPACE
nnoremap <SPACE> <Nop>
" let mapleader = "\<SPACE>"
let mapleader = " "

" Lets stop using Escape switch
inoremap jk <Esc>


" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

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

" Seamless navigation between vim buffers and tmux panes (must have with Tmux)
Plug 'christoomey/vim-tmux-navigator'

" Fast search keywords
Plug 'mileszs/ack.vim'

" Different colors for intricated [[(({}))]]
Plug 'luochen1990/rainbow'

" Hard to use for now, will check it out later --> lets try the cousin plugin
Plug 'machakann/vim-sandwich'

" camel/snake_case conversions (crs and crc), and more features I should try
Plug 'tpope/vim-abolish'

" Nice colorscheme
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'chriskempson/base16-vim'

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

" for nice icons <- require a nerd font installed (on your machine)
Plug 'kyazdani42/nvim-web-devicons'

" File explorer
Plug 'kyazdani42/nvim-tree.lua'

" Status line
Plug 'akinsho/nvim-bufferline.lua'

" Next updates:
" vimspector: debugger in vim

" Initialize plugin system
call plug#end()

set termguicolors
lua require'bufferline'.setup{}
" :bd to remove buffer

source /home/sv/dotfiles/config/nvim/thib/telescope.vim

set pyxversion=3

colorscheme onehalfdark
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
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }


let g:floaterm_keymap_toggle = '<Leader><Leader>'
let g:floaterm_keymap_new = '<Leader>fn'

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

nnoremap <F2> :NvimTreeToggle<CR>


source /home/sv/dotfiles/config/nvim/thib/abolish.vim
source /home/sv/dotfiles/config/nvim/thib/coc.vim
source /home/sv/dotfiles/config/nvim/thib/utils.vim

nnoremap <leader>m :MaximizerToggle!<CR>

" Switch betweeen buffered files
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Set to auto read when a file is changed from the outside
set autoread
au CursorHold * checktime

" I forgot what's this for
"autocmd StdinReadPre * let s:std_in=1

