return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      lightbulb = {
        enable = false,
      },
      finder = {
        keys = {
          toggle_or_open = "<cr>",
        },
      },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
  keys = {
    { "<leader>rr", "<cmd>Lspsaga rename<cr>", desc = "Rename symbol under cursor" },
    { "<leader>gr", "<cmd>Lspsaga finder<cr>", desc = "Find references to symbol under cursor" },
  },
}
