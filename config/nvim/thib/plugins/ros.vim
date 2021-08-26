" Both for vim-ros plugin and my own ros.lua functions
let g:ros_make="current"

lua require("thib.ros")

let g:make_split_height=12

command! GenerateCompileCommands :lua require(thib.ros).generate_compile_commands()
nnoremap <leader>bb <cmd>lua require('thib.ros').catkin_make()<cr>
nnoremap <leader>bd <cmd>lua require('thib.ros').catkin_make_all_debug()<cr>
nnoremap <leader>bp <cmd>lua require('thib.ros').catkin_make_pkg()<cr>
nnoremap <leader>rt <cmd>lua require('thib.ros').rostest()<cr>
nnoremap <leader>os <cmd>lua require('thib.ros').open_split()<cr>
nnoremap <C-x> <cmd>lua require('thib.ros').execute_current_file()<cr>
nnoremap <leader>te <cmd>lua require('thib.ros').testF()<cr>
