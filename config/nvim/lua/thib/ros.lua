local catkin_make = require("ros-nvim.build").catkin_make
local utils = require("ros-nvim.vim-utils")

require("ros-nvim").setup(
    {
        catkin_ws_link_from = "/home/sv/catkin_ws/src",
        catkin_ws_link_to = "~/main",
        open_terminal_method = function()
            require "ros-nvim.vim-utils".open_new_buffer()
        end
    }
)

local function generate_compile_commands()
    catkin_make("_all_debug", "-DCMAKE_EXPORT_COMPILE_COMMANDS=YES")
    utils.send_command_to_current_term("mv ~/catkin_ws/build/compile_commands.json ~/main")
end

local opts = { noremap = true, silent = true }
-- vim.api.nvim_add_user_command('GenerateCompileCommands',  generate_compile_commands(), {n_args = 0})

-- ROS-NVIM
vim.keymap.set('n', '<leader>rtl', require('ros-nvim.telescope.pickers').topic_picker, opts)
vim.keymap.set('n', '<leader>rnl', require('ros-nvim.telescope.pickers').node_picker, opts)
vim.keymap.set('n', '<leader>rsl', require('ros-nvim.telescope.pickers').service_picker, opts)
vim.keymap.set('n', '<leader>rpl', require('ros-nvim.telescope.pickers').param_picker, opts)
vim.keymap.set('n', '<leader>rds', require('ros-nvim.telescope.pickers').srv_picker, opts)
vim.keymap.set('n', '<leader>rdm', require('ros-nvim.telescope.pickers').msg_picker, opts)

-- Build
vim.keymap.set('n', '<leader>bb', require('ros-nvim.build').catkin_make, opts)
vim.keymap.set('n', '<leader>bp', require('ros-nvim.build').catkin_make_pkg, opts)
vim.keymap.set('n', '<leader>bd', function() require('ros-nvim.build').catkin_make("_all_debug") end, opts)

-- Test
vim.keymap.set('n', '<leader>rt', require('ros-nvim.test').rostest, opts)

-- Find/grep
vim.keymap.set('n', '<leader>fp', require('ros-nvim.telescope.package').search_package, opts)
vim.keymap.set('n', '<leader>fgp', require('ros-nvim.telescope.package').grep_package, opts)

