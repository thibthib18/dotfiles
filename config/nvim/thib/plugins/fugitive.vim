nnoremap <leader>gs :tab Git<cr>

command! Gpush :Git -c push.default=current push
command! Gpull :Git pull
command! Gcommit :Git commit
command! Gcamend :Git commit --amend
nnoremap <leader>gid :Gvdiffsplit!

