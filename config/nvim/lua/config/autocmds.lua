-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name) return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true }) end

-- vim.cmd("autocmd FileType php inoremap . ->")
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("replace_dot_with_arrow"),
  pattern = { "php" },
  callback = function(event) vim.keymap.set("i", "..", "->", { buffer = event.buf, silent = true }) end,
})
