" Both for vim-ros plugin and my own ros.lua functions
let g:ros_make="current"

lua require("thib.ros")
nnoremap <leader>bb <cmd>lua require('thib.ros').catkin_make()<cr>
nnoremap <leader>rt <cmd>lua require('thib.ros').rostest()<cr>

