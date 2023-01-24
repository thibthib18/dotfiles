-- Switch betweeen buffered files
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "J", ":BufferLineCyclePrev<cr>", opts)
vim.api.nvim_set_keymap("n", "K", ":BufferLineCycleNext<cr>", opts)

vim.api.nvim_set_keymap("n", "H", ":BufferLineMovePrev<cr>", opts)
vim.api.nvim_set_keymap("n", "L", ":BufferLineMoveNext<cr>", opts)
