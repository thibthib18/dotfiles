local dap = require"dap"
local port = 33982
dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = "Attach to running Neovim instance",
  }
}

dap.adapters.nlua = function(callback, config)
  callback({ type = 'server', host = config.host or "127.0.0.1", port = port or config.port })
end

return port
--[[ *** instructions ***
1. Open a Neovim instance (instance A)
2. Launch the DAP server with (A) >
 :lua require"osv".launch()
< Note: Write down the port number
3. Open another Neovim instance (instance B)
4. Open `myscript.lua` (B)
5. Place a breakpoint on line 2 using (B) >
  :lua require"dap".toggle_breakpoint()
<6. Connect the DAP client using (B) >
  :lua require"dap".continue()
< Note: host - Press return, leave default
       port - Enter the port you wrote down
7. Run `myscript.lua` in the other instance (A) >
  :luafile myscript.lua
<8. The breakpoint should hit and freeze the instance (B)
--]]

--[[ ** to manually enter the host and port every time
      host = function()
        local value = vim.fn.input('Host [127.0.0.1]: ')
        if value ~= "" then
          return value
        end
        return '127.0.0.1'
      end,
      port = function()
        local val = tonumber(vim.fn.input('Port: '))
        assert(val, "Please provide a port number")
        return val
      end,
--]]
