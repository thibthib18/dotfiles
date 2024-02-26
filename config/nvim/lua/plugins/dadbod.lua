return {
  "tpope/vim-dadbod",
  dependencies = {
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
  },
  config = function()
    vim.g.db_ui_save_location = vim.fn.stdpath("config") .. "/db_ui"
    local mongo_host = vim.env["MONGODB_HOST"]
    local mongo_port = 27017
    local mongo_connection_string = "mongodb://" .. mongo_host .. ":" .. mongo_port
    vim.g.dbs = { dop = mongo_connection_string }
  end,
  keys = { { "<leader>dbt", vim.cmd.DBUIToggle, { desc = "Open database explorer" } } },
  cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
}
