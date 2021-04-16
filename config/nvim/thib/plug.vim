
" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

" Git interface
Plug 'tpope/vim-fugitive'

" LSP plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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
Plug 'dracula/vim', { 'as': 'dracula' }

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

" top buffer line
Plug 'akinsho/nvim-bufferline.lua'
" Status line
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}


" Next updates:
" vimspector: debugger in vim

" Initialize plugin system
call plug#end()
