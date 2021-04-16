
lua require("thib")

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>ui <cmd>lua require('thib.telescope').search_ui_components()<cr>

"TODO: default is checkout branch (head detached) and c-t to track; change this
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
