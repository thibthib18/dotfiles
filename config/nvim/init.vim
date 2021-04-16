" Set leader key to SPACE
nnoremap <SPACE> <Nop>
" let mapleader = "\<SPACE>"
let mapleader = " "

" Lets stop using Escape switch
inoremap jk <Esc>

" Switch betweeen buffered files
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Load some nice defaults
source /home/sv/dotfiles/config/nvim/thib/goodDefaults.vim

" Plug plugins
source /home/sv/dotfiles/config/nvim/thib/plug.vim

" Set up plugins
source /home/sv/dotfiles/config/nvim/thib/plugins/telescope.vim
source /home/sv/dotfiles/config/nvim/thib/plugins/bufferline.vim
source /home/sv/dotfiles/config/nvim/thib/plugins/nvim-tree.vim
source /home/sv/dotfiles/config/nvim/thib/plugins/abolish.vim
source /home/sv/dotfiles/config/nvim/thib/plugins/coc.vim
source /home/sv/dotfiles/config/nvim/thib/plugins/utils.vim

set pyxversion=3
colorscheme onehalfdark
set background=dark
set signcolumn=yes:1
let g:rainbow_active = 1
nnoremap <leader>m :MaximizerToggle!<CR>

" I forgot what's this for
"autocmd StdinReadPre * let s:std_in=1

