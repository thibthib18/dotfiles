nnoremap <leader>gs :tab Gstatus<cr>

command! Gpush :Git -c push.default=current push
command! Gpull :Git pull
command! Gcommit :Git commit
nnoremap <leader>gid :Gvdiffsplit!

