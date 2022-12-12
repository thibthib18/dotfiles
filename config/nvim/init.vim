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

" Toggle folds more easily
nnoremap zz za

"nnoremap <leader>mrl :Octo mr list #<cr>
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
lua require("thib.packer")
source ~/.config/nvim/thib/plugins/utils.vim
" lua pcall(require,"thib")
lua require('thib')


" TODO: move to lua
augroup Format
    autocmd!
    autocmd BufWritePost * FormatWrite
augroup END

set pyxversion=3
set background=dark
set signcolumn=yes:1
let g:rainbow_active = 1
"nnoremap <leader>m :MaximizerToggle!<CR>

nnoremap n nzzzv
nnoremap N Nzzzv
" I forgot what's this for
"autocmd StdinReadPre * let s:std_in=1

