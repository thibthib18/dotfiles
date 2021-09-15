
" Add MR link virtual text
nnoremap <leader>mru <cmd>lua require('thib.glab').get_current_line_mr()<cr>
nnoremap <leader>mrg <cmd>lua require('thib.glab').generate_commit_mr_table()<cr>
