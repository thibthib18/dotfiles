local catkin_make = require("ros-nvim.build").catkin_make
local utils = require("ros-nvim.vim-utils")

require("ros-nvim").setup({})

local function generate_compile_commands()
    catkin_make("_all_debug", "-DCMAKE_EXPORT_COMPILE_COMMANDS=YES")
    utils.send_command_to_current_term("mv ~/catkin_ws/build/compile_commands.json ~/main")
end

return {
    generate_compile_commands = generate_compile_commands
}
