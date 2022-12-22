require'nvim-tree'.setup({})

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  { key="<cr>", cb= tree_cb("edit")},
  { key="o", cb= tree_cb("edit")},
  { key="<2-LeftMouse>", cb= tree_cb("edit")},
  { key="<2-RightMouse>", cb= tree_cb("cd")},
  { key="C", cb= tree_cb("cd")},
  { key="s", cb= tree_cb("vsplit")},
  { key="i", cb= tree_cb("split")},
  { key="<C-t>", cb= tree_cb("tabnew")},
  { key="<", cb= tree_cb("prev_sibling")},
  { key=">", cb= tree_cb("next_sibling")},
  { key="<BS>", cb= tree_cb("close_node")},
  { key="<S-cr>", cb= tree_cb("close_node")},
  { key="<Tab>", cb= tree_cb("preview")},
  { key="I", cb= tree_cb("toggle_ignored")},
  { key="H", cb= tree_cb("toggle_dotfiles")},
  { key="R", cb= tree_cb("refresh")},
  { key="a", cb= tree_cb("create")},
  { key="d", cb= tree_cb("remove")},
  { key="<C-r>", cb= tree_cb("rename")},
  { key="r", cb= tree_cb("full_rename")},
  { key="x", cb= tree_cb("cut")},
  { key="c", cb= tree_cb("copy")},
  { key="p", cb= tree_cb("paste")},
  { key="[c", cb= tree_cb("prev_git_item")},
  { key="]c", cb= tree_cb("next_git_item")},
  { key="u", cb= tree_cb("dir_up")},
  { key="q", cb= tree_cb("close")},
}

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>ftt', vim.cmd.NvimTreeToggle, opts)
vim.keymap.set('n', '<leader>ftf', vim.cmd.NvimTreeFindFile, opts)
