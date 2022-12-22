

vim.cmd([[
" Automatically trim whitespace at EOL when saving
function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

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
]])

local M = {}

function M.is_buffer_empty()
    -- Check whether the current buffer is empty
    return vim.fn.empty(vim.fn.expand("%:t")) == 1
end

function M.has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end

return M
