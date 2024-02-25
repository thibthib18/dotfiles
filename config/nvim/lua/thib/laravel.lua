local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>la', ":Laravel artisan<cr>", opts)
vim.keymap.set('n', '<leader>lr', ":Laravel routes<cr>", opts)
vim.keymap.set('n', '<leader>lm', ":Laravel related<cr>", opts)


require('laravel').setup({
  features = {
    null_ls = {
      enable = false,
    }
  }
})
