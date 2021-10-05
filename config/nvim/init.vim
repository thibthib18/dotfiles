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
nnoremap <leader>X :bp\|bd! #<cr>
nnoremap <leader>e :Telescope emoji<cr>

nnoremap V v$
nnoremap <leader>mrl :Octo mr list #<cr>
" Exit terminal mode with C-o
tnoremap <C-o> <C-\><C-n>

" Highlight yanked text for 1 second
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=1000 }
augroup END


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
source ~/.config/nvim/thib/plugins/glab.vim
source ~/.config/nvim/thib/plugins/completion.vim
source ~/.config/nvim/thib/plugins/vimtest.vim
lua require("galaxylinePlugin")
lua require("thib")
lua require("octo").setup()

" TODO: move to lua
augroup Format
    autocmd!
    autocmd BufWritePost * FormatWrite
augroup END

set pyxversion=3
colorscheme onehalfdark
set background=dark
set signcolumn=yes:1
let g:rainbow_active = 1
"nnoremap <leader>m :MaximizerToggle!<CR>

nnoremap n nzzzv
nnoremap N Nzzzv
" I forgot what's this for
"autocmd StdinReadPre * let s:std_in=1

