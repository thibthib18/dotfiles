-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--

print("Loading keymaps.lua...")
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")

-- Buffer navigation
--
-- Missing:
-- move left/right
-- delete buffer and go to previous one
-- move buffer in line
--
-- vim.keymap.del("n", "<S-l>")
-- vim.keymap.del("n", "<S-h>")
-- vim.keymap.del("n", "<S-j>")
-- vim.keymap.del("n", "<S-k>")
--
-- local opts = { noremap = true, silent = true }
-- vim.keymap.set({ "n", "v", "x" }, "<S-k>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer", remap = true })

-- Typescript
-- ok with extras
-- C++
-- to test
-- Python OK

-- camel case words

-- Session management
-- save
-- load

-- Telescope
-- grep
-- customs
-- find files in project
-- find files local

-- Treesitter function/class navigation
