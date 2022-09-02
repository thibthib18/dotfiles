nnoremap <leader>qf <cmd>lua require('telescope.builtin').quickfix()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fgg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>ui <cmd>lua require('thib.telescope').search_ui_components()<cr>
nnoremap <leader>fgui <cmd>lua require('thib.telescope').grep_ui_components()<cr>
nnoremap <leader>fe <cmd>lua require('thib.telescope').search_frontend()<cr>
nnoremap <leader>fgfe <cmd>lua require('thib.telescope').grep_frontend()<cr>
nnoremap <leader>op <cmd>lua require('thib.telescope').search_operations()<cr>
nnoremap <leader>fgop <cmd>lua require('thib.telescope').grep_operations()<cr>
nnoremap <leader>wa <cmd>lua require('thib.telescope').search_workflow_automation()<cr>
nnoremap <leader>fgwa <cmd>lua require('thib.telescope').grep_workflow_automation()<cr>
nnoremap <leader>fgc <cmd>lua require('thib.telescope').grep_cwd()<cr>
nnoremap <leader>fr :Telescope resume<cr><esc>

nnoremap <leader>fp <cmd>lua require('ros-nvim.telescope.package').search_package()<cr>
nnoremap <leader>fgp <cmd>lua require('ros-nvim.telescope.package').grep_package()<cr>

vnoremap <leader>g :lua require('thib.telescope').grep_current_selection()<cr>
nnoremap <leader>sd <cmd>lua require('thib.telescope').search_dotfiles()<cr>
nnoremap <leader>fgsd <cmd>lua require('thib.telescope').grep_dotfiles()<cr>
nnoremap <leader>/ <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>ee <cmd>lua require('telescope.builtin').symbols{ sources = {'emoji'} }<cr>
nnoremap <leader>gb <cmd>lua require('thib.telescope').git_branches()<cr>
nnoremap <leader>' <cmd>lua require('telescope.builtin').marks()<cr>
nnoremap <leader>th <cmd>lua require('telescope.builtin').colorscheme({enable_preview=true})<cr>
