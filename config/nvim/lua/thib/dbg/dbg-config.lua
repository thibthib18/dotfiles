require('telescope').load_extension('dap')

local utils = require('thib.utils')
local lua_dap_port = require('thib.dbg.lua-dap')

utils.map('n', '<leader>dc', '<cmd>lua require"dap".continue()<CR>')
utils.map('n', '<leader>dsv', '<cmd>lua require"dap".step_over()<CR>')
utils.map('n', '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>')
utils.map('n', '<leader>dso', '<cmd>lua require"dap".step_out()<CR>')
utils.map('n', '<leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
utils.map('n', '<leader>dsbr', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
utils.map('n', '<leader>dsbm', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
utils.map('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>')
utils.map('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>')

-- telescope-dap
utils.map('n', '<leader>dcc', '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
utils.map('n', '<leader>dco', '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
utils.map('n', '<leader>dlb', '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
utils.map('n', '<leader>dv', '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
utils.map('n', '<leader>df', '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')

-- lua debugger
utils.map('n', '<leader>dss', '<cmd>lua require"osv".launch({port = '.. lua_dap_port .. '})<CR>')
-- start server
-- connect