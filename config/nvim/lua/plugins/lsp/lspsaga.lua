return {
  "nvimdev/lspsaga.nvim",
  config = function() require("lspsaga").setup({}) end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
  keys = {
    { "<leader>rr", "<cmd>Lspsaga rename<cr>", desc = "Rename symbol under cursor" },
  },
}
