local iron = require("iron.core")

iron.setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        -- Can be a table or a function that
        -- returns a table (see below)
        command = { "zsh" }
      }
    },
    -- How the repl window will be displayed
    -- See below for more information
    -- repl_open_cmd = require('iron.view').right(40),
    repl_open_cmd = "vertical botright 70 split"
  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    send_motion = "<leader>k",
    visual_send = "<leader>kk",
    send_file = "<leader>kf",
    send_line = "<leader>kk",
    -- cr = "<leader>s<cr>",
    -- exit = "<space>sq",
    -- clear = "<space>cl",
    -- focus = "<space>ig",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>kr', iron.repl_restart, opts)
