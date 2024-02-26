-- Tests
-- kinda works: Python
-- no colors in output
-- default output in panel
-- TS: not working

return {
  "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-jest",
    },
  -- stylua: ignore
  keys = {
    { "<leader>tf", false},
    { "<leader>tT", false},
    { "<leader>tn", function() require("neotest").run.run() end, desc = "Run Nearest" },
    { "<leader>tl", false},
    { "<leader>ts", false},
    { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
    { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
    { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },
  },
  opts = {
    adapters = {
      ["neotest-jest"] = {
          cwd = function(path)
            return path:match'(.*/npm)'
          end,
      },
    },
  },
}
