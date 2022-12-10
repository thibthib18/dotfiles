vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', {silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-j>", "<Plug>(copilot-next)", {silent = true, expr = false, noremap = false})
vim.api.nvim_set_keymap("i", "<C-k>", "<Plug>(copilot-previous)", {silent = true, expr = false, noremap = false})
vim.api.nvim_set_keymap("i", "<C-h>", "<Plug>(copilot-suggest)", {silent = true, expr = false, noremap = false})

-- use { "zbirenbaum/copilot.lua" }
-- and https://github.com/zbirenbaum/copilot-cmp
