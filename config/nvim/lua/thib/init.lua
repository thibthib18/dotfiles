require("thib.telescope")
require("thib.nvim-tree")
require("thib.lspconfig")
require("thib.nvim-treesitter")
require("thib.ros")
require("thib.format")
-- dbg module init.lua somehow cant find the files
require("thib.dbg.dapui")
require("thib.dbg.dap-virtual-text")
require("thib.dbg.dbg-config")
require("thib.dbg.lua-dap")

-- TODO add to its own file
vim.notify = require("notify")
