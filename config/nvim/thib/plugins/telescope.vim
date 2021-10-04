nnoremap <leader>qf <cmd>lua require('telescope.builtin').quickfix()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fgg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>ui <cmd>lua require('thib.telescope').search_ui_components()<cr>
nnoremap <leader>fe <cmd>lua require('thib.telescope').search_frontend()<cr>

nnoremap <leader>fp <cmd>lua require('ros-nvim.telescope.package').search_package()<cr>
nnoremap <leader>fgp <cmd>lua require('ros-nvim.telescope.package').grep_package()<cr>

nnoremap <leader>sd <cmd>lua require('thib.telescope').search_dotfiles()<cr>
nnoremap <leader>/ <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>ee <cmd>lua require('telescope.builtin').symbols{ sources = {'emoji'} }<cr>
nnoremap <leader>gb <cmd>lua require('thib.telescope').git_branches()<cr>
nnoremap ' <cmd>lua require('telescope.builtin').marks()<cr>
