

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


