" Set leader key to SPACE
nnoremap <SPACE> <Nop>
" let mapleader = "\<SPACE>"
let mapleader = " "

" Lets stop using Escape switch
inoremap jk <Esc>

" Switch betweeen buffered files
nnoremap J :bprevious<cr>
nnoremap K :bnext<cr>
nnoremap <leader>x :bp\|bd #<cr>



" Load some nice defaults
source ~/.config/nvim/thib/goodDefaults.vim

" Plug plugins
source ~/.config/nvim/thib/plug.vim

" Set up plugins
source ~/.config/nvim/thib/plugins/telescope.vim
source ~/.config/nvim/thib/plugins/bufferline.vim
source ~/.config/nvim/thib/plugins/nvim-tree.vim
source ~/.config/nvim/thib/plugins/abolish.vim
source ~/.config/nvim/thib/plugins/coc.vim
source ~/.config/nvim/thib/plugins/utils.vim
source ~/.config/nvim/thib/plugins/nvim-hlslens.vim
source ~/.config/nvim/thib/plugins/fugitive.vim
source ~/.config/nvim/thib/plugins/ros.vim
source ~/.config/nvim/thib/plugins/completion.vim
lua require("galaxylinePlugin")
lua require("thib.lspconfig")

set pyxversion=3
colorscheme onehalfdark
set background=dark
set signcolumn=yes:1
let g:rainbow_active = 1
nnoremap <leader>m :MaximizerToggle!<CR>

" I forgot what's this for
"autocmd StdinReadPre * let s:std_in=1

