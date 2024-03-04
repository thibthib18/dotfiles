return {
  "tpope/vim-dadbod",
  dependencies = {
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
  },
  config = function()
    vim.g.db_ui_save_location = vim.fn.stdpath("config") .. "/db_ui"
    vim.g.dbs = { dop = mongo_connection_string }
    local mongo_host = vim.env["MONGODB_HOST"] or "localhost"
    local mongo_port = vim.env["MONGODB_EXTERNAL_PORT"] or 27017
    local mongo_databse = vim.env["MONGODB_DATABASE"] or "local"
    local mongo_connection_string = "mongodb://" .. mongo_host .. ":" .. mongo_port .. "/" .. mongo_databse
  end,
  keys = { { "<leader>dbt", vim.cmd.DBUIToggle, { desc = "Open database explorer" } } },
  cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
}
