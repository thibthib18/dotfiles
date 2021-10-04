" Both for vim-ros plugin and my own ros.lua functions
let g:ros_make="current"

lua require("thib.ros")
lua require("thib.nvim-tree")

let g:make_split_height=8

command! GenerateCompileCommands :lua require('thib.ros').generate_compile_commands()

" Build package
nnoremap <leader>bb <cmd>lua require('thib.ros').catkin_make()<cr>
nnoremap <leader>bd <cmd>lua require('thib.ros').catkin_make_all_debug()<cr>
nnoremap <leader>bp <cmd>lua require('thib.ros').catkin_make_pkg()<cr>

nnoremap <leader>rt <cmd>lua require('thib.ros').rostest()<cr>
nnoremap <leader>os <cmd>lua require('thib.utils').open_split()<cr>
nnoremap <C-x> <cmd>lua require('thib.utils').execute_current_file()<cr>
nnoremap <leader>te <cmd>lua require('thib.ros').testF()<cr>

" ROS-NVIM
nnoremap <leader>rtl <cmd>lua require('thib.ros-nvim').topic_picker()<cr>
nnoremap <leader>rnl <cmd>lua require('thib.ros-nvim').node_picker()<cr>
nnoremap <leader>rsl <cmd>lua require('thib.ros-nvim').service_picker()<cr>
nnoremap <leader>rds <cmd>lua require('thib.ros-nvim').srv_picker()<cr>
nnoremap <leader>rdm <cmd>lua require('thib.ros-nvim').msg_picker()<cr>

" change directory
nnoremap <leader>cdp <cmd>lua require('thib.nvim-tree').set_cwd_current_package()<cr>
nnoremap <leader>cdc <cmd>lua require('thib.nvim-tree').set_cwd_current_file()<cr>
nnoremap <leader>cdm <cmd>lua require('thib.nvim-tree').set_cwd_main()<cr>
