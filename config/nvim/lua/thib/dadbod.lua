local M = {}

function M.setup()
    vim.g.db_ui_save_location = vim.fn.stdpath "config" .. require("plenary.path").path.sep .. "db_ui"
    local mongo_host = vim.env["MONGODB_HOST"]
    local mongo_port = 27017
    local mongo_connection_string = "mongodb://" .. mongo_host .. ":" .. mongo_port
    vim.g.dbs = {dop = mongo_connection_string}
end

-- vim.keymap.set('n', 'dbt', '<cmd><CR>', { desc = "format document [LSP]" })
vim.keymap.set("n", "<leader>dbt", ":DBUIToggle<cr>", {desc = "Open database explorer"})
-- -- Database
-- D = {
--   name = "Database",
--   u = { "<Cmd>DBUIToggle<Cr>", "Toggle UI" },
--   f = { "<Cmd>DBUIFindBuffer<Cr>", "Find buffer" },
--   r = { "<Cmd>DBUIRenameBuffer<Cr>", "Rename buffer" },
--   q = { "<Cmd>DBUILastQueryInfo<Cr>", "Last query info" },
-- },

return M
