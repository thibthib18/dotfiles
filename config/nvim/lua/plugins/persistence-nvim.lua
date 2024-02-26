return {
  "folke/persistence.nvim",
    -- stylua: ignore
    keys = {
      { "<leader>qs", false},
      { "<leader>sl", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", false},
    },
}
