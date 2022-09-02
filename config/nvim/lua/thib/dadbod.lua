local M = {}

function M.setup()
    vim.g.db_ui_save_location = vim.fn.stdpath "config" .. require("plenary.path").path.sep .. "db_ui"
    local mongo_host = vim.env["MONGODB_HOST"]
    local mongo_port = 27017
    local mongo_connection_string = "mongodb://" .. mongo_host .. ":" .. mongo_port
    vim.g.dbs = {dop = mongo_connection_string}
end

vim.keymap.set("n", "<leader>dbt", ":DBUIToggle<cr>", {desc = "Open database explorer"})

return M
