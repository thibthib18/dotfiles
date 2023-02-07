vim.cmd([[
" Set leader key to SPACE
nnoremap <SPACE> <Nop>
" let mapleader = "\<SPACE>"
let mapleader = " "

" Lets stop using Escape switch
inoremap jk <Esc>

nnoremap <leader>x :bp\|bd #<cr>
nnoremap <leader>X :bp\|bd! #<cr>

" Toggle folds more easily
" nnoremap zz za

"nnoremap <leader>mrl :Octo mr list #<cr>
" Exit terminal mode with C-o
tnoremap <C-o> <C-\><C-n>

" Highlight yanked text for 1 second
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=1000 }
augroup END

set pyxversion=3
set background=dark
set signcolumn=yes:1
let g:rainbow_active = 1
"nnoremap <leader>m :MaximizerToggle!<CR>

nnoremap n nzzzv
nnoremap N Nzzzv
]])

require("thib.packer")

require("thib.session")
require('thib.goodDefaults')
require('thib.utils')

if not pcall(require, 'ros-nvim') then
  -- then probably plugins arent installed yet
  return
end

require("ros-nvim").setup {}
require("thib.notify")
require("thib.nvim-treesitter")
require('thib.lsp.setup')
require("thib.debug.setup")
-- require("thib.glab") -- disabled for now
require("thib.utils")
require("thib.refactoring")
require('thib.gitsigns')
require("thib.dadbod")
require("thib.colors")

require('thib.telescope.mappings')
require("thib.nvim-tree.mappings")
require('thib.mongo')
require('thib.bufferline')
require('thib.fugitive')
