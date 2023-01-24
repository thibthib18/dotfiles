local dap = require("dap")
dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = {vim.fn.stdpath('data') .. "/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js"}
}

dap.configurations.javascriptreact = {
    -- change this to javascript if needed
    {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}

dap.configurations.typescriptreact = {
    -- change to typescript if needed
    {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}
