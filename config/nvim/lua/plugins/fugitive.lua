return {
  "tpope/vim-fugitive",
  config = function()
    vim.cmd([[
      command! Gpush :Git -c push.default=current push
      command! Gpull :Git pull
    ]])
  end,
  keys = {
    { "<leader>gs", ":tab Git<cr>", desc = "Open Git in a new tab" },
  },
}
