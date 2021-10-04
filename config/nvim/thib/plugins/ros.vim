command! GenerateCompileCommands :lua require('thib.ros').generate_compile_commands()
lua << EOF
require("ros-nvim.telescope.previewer")
require("ros-nvim.telescope.pickers")
EOF

nnoremap <leader>os <cmd>lua require('thib.utils').open_split()<cr>
nnoremap <C-x> <cmd>lua require('thib.utils').execute_current_file()<cr>
" ROS-NVIM
nnoremap <leader>rtl <cmd>lua require('ros-nvim.telescope.pickers').topic_picker()<cr>
nnoremap <leader>rnl <cmd>lua require('ros-nvim.telescope.pickers').node_picker()<cr>
nnoremap <leader>rsl <cmd>lua require('ros-nvim.telescope.pickers').service_picker()<cr>
nnoremap <leader>rds <cmd>lua require('ros-nvim.telescope.pickers').srv_picker()<cr>
nnoremap <leader>rdm <cmd>lua require('ros-nvim.telescope.pickers').msg_picker()<cr>

" Build
nnoremap <leader>bb <cmd>lua require('ros-nvim.build').catkin_make()<cr>
nnoremap <leader>bp <cmd>lua require('ros-nvim.build').catkin_make_pkg()<cr>
" Test
nnoremap <leader>rt <cmd>lua require('ros-nvim.test').rostest()<cr>

" change directory
nnoremap <leader>cdp <cmd>lua require('thib.nvim-tree').set_cwd_current_package()<cr>
nnoremap <leader>cdc <cmd>lua require('thib.nvim-tree').set_cwd_current_file()<cr>
nnoremap <leader>cdm <cmd>lua require('thib.nvim-tree').set_cwd_main()<cr>
