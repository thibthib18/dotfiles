local Util = require("lazyvim.util")
return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>ftt",
      function() require("neo-tree.command").execute({ toggle = true }) end,
      desc = "Explorer NeoTree (root dir)",
    },
    {
      "<leader>ftf",
      function() require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() }) end,
      desc = "Explorer NeoTree (cwd)",
    },
    { "<leader>e", false },
    { "<leader>fe", false },
    { "<leader>E", false },
    { "<leader>ge", false },
    { "<leader>be", false },
  },
}
