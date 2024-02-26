return {
  {
    "thibthib18/ros-nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("ros-nvim").setup({
        catkin_ws_link_from = "/home/sv/catkin_ws/src",
        catkin_ws_link_to = "~/main",
        open_terminal_method = function() require("ros-nvim.vim-utils").open_new_buffer() end,
      })
      -- local catkin_make = require("ros-nvim.build").catkin_make
      -- local utils = require("ros-nvim.vim-utils")
      --
      -- local function generate_compile_commands()
      --   catkin_make("_all_debug", "-DCMAKE_EXPORT_COMPILE_COMMANDS=YES")
      --   utils.send_command_to_current_term("mv ~/catkin_ws/build/compile_commands.json ~/main")
      -- end
      -- vim.api.nvim_add_user_command('GenerateCompileCommands',  generate_compile_commands(), {n_args = 0})
    end,
    keys = {
      -- Pickers
      { "<leader>rtl", function() require("ros-nvim.telescope.pickers").topic_picker() end },
      { "<leader>rnl", function() require("ros-nvim.telescope.pickers").node_picker() end },
      { "<leader>rsl", function() require("ros-nvim.telescope.pickers").service_picker() end },
      { "<leader>rpl", function() require("ros-nvim.telescope.pickers").param_picker() end },
      { "<leader>rds", function() require("ros-nvim.telescope.pickers").srv_picker() end },
      { "<leader>rdm", function() require("ros-nvim.telescope.pickers").msg_picker() end },

      -- Build
      { "<leader>bb", function() require("ros-nvim.build").catkin_make() end },
      { "<leader>bp", function() require("ros-nvim.build").catkin_make_pkg() end },

      -- Test
      { "<leader>rt", function() require("ros-nvim.test").rostest() end },

      -- Find/grep
      { "<leader>fp", function() require("ros-nvim.telescope.package").search_package() end },
      { "<leader>fgp", function() require("ros-nvim.telescope.package").grep_package() end },
    },
  },
}
