
" Add MR link virtual text
nnoremap <leader>mru <cmd>lua require('thib.glab').get_current_line_mr()<cr>
nnoremap <leader>mrg <cmd>lua require('thib.glab').generate_commit_mr_table()<cr>

" Some utils
" Gclog : commit list
" Gclog % : commit list for current file
" Gclog -10 -- % : commit list last 10 commits for current file

" git line blame -> glb
nnoremap <leader>glb <cmd>lua require('thib.glab').current_line_commit_log()<cr>
