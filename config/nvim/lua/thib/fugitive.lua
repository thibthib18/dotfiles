
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>gs',':tab Git<cr>', opts)

vim.cmd([[
  command! Gpush :Git -c push.default=current push
  command! Gpull :Git pull
]])
