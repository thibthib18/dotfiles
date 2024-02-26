local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>ss', ':mks!<cr>', opts)
vim.keymap.set('n', '<leader>sl', ':source Session.vim<cr>', opts)
