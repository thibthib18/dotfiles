require("telescope").load_extension("dap")

local lua_dap_port = require("thib.dbg.lua-dap")

local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<leader>dc", require"dap".continue, opts)
vim.keymap.set("n", "<leader>dsv", require"dap".step_over, opts)
vim.keymap.set("n", "<leader>dsi", require"dap".step_into, opts)
vim.keymap.set("n", "<leader>dso", require"dap".step_out, opts)
vim.keymap.set("n", "<leader>dtb", require"dap".toggle_breakpoint, opts)
vim.keymap.set("n", "<leader>dsb", function() require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: ")) end , opts)
-- vim.keymap.set(
--     "n",
--     "<leader>dsbm",
--     require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
-- )
vim.keymap.set("n", "<leader>dro", require"dap".repl.open, opts)
-- vim.keymap.set("n", "<leader>drl", require"dap".repl.run_last, opts)

-- telescope-dap
vim.keymap.set("n", "<leader>dcc", require"telescope".extensions.dap.commands, opts)
vim.keymap.set("n", "<leader>dco", require"telescope".extensions.dap.configurations, opts)
vim.keymap.set("n", "<leader>dlb", require"telescope".extensions.dap.list_breakpoints, opts)
vim.keymap.set("n", "<leader>dv", require"telescope".extensions.dap.variables, opts)
vim.keymap.set("n", "<leader>df", require"telescope".extensions.dap.frames, opts)

-- lua debugger
vim.keymap.set("n", "<leader>dss", function() require"osv".launch({port = lua_dap_port}) end, opts)
-- start server
-- connect
