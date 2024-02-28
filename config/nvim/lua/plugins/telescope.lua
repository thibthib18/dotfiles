local builtin = require("telescope.builtin")
local utils = require("custom.telescope.utils")

return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        find_files = {
          hidden = true,
        },
      },
      defaults = {
        file_ignore_patterns = { "venv/*", "tmux/plugins/*", "node_modules/*", "third_party", "vendor" },
      },
    },
    keys = function()
      return {
        { "<leader>fg", nil },
    -- stylua: ignore
      { "<leader>sl", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
        { "<leader>qf", builtin.quickfix },
        { "<leader>ff", builtin.find_files },
        { "<leader>fgg", builtin.live_grep },
        { "<leader>fb", builtin.buffers },
        { "<leader>fh", builtin.help_tags },
        { "<leader>ui", utils.search_ui_components },
        { "<leader>fgui", utils.grep_ui_components },
        { "<leader>fe", utils.search_frontend },
        { "<leader>fgfe", utils.grep_frontend },
        { "<leader>3d", utils.search_3d_viz },
        { "<leader>fg3d", utils.grep_3d_viz },
        { "<leader>nr", utils.search_nodered },
        { "<leader>fgnr", utils.grep_nodered },
        { "<leader>op", utils.search_opera },
        { "<leader>fgop", utils.grep_operations },
        { "<leader>wa", utils.search_workflow_automation },
        { "<leader>fgwa", utils.grep_workflow_automation },
        { "<leader>e2e", utils.search_e2e },
        { "<leader>fgc", utils.grep_cwd },
        { "<leader>fr", ":Telescope resume<cr><esc>" },
        { "<leader>g", utils.grep_current_selection },
        { "<leader>sd", utils.search_dotfiles },
        { "<leader>fgsd", utils.grep_dotfiles },
        { "<leader>/", builtin.current_buffer_fuzzy_find },
      -- stylua: ignore
      {"<leader>ee", function() builtin.symbols { sources = { 'emoji' } } end},
        { "<leader>gb", utils.git_branches },
        { "<leader>'", builtin.marks },
      -- stylua: ignore
      {"<leader>th", function() builtin.colorscheme({ enable_preview = true }) end},
      }
    end,
  },

  {
    "nvim-telescope/telescope-fzy-native.nvim",
    config = function() require("telescope").load_extension("fzy_native") end,
  },
  {
    "LinArcX/telescope-env.nvim",
    config = function() require("telescope").load_extension("env") end,
  },
}
