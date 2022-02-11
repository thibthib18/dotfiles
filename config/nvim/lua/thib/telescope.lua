local tros = require("thib.ros")

require("telescope").setup {
    defaults = {
        file_ignore_patterns = {"venv/*", "tmux/plugins/*", "node_modules/*", "third_party"}
    }
}
require("telescope").load_extension("fzy_native")
require("telescope").load_extension("dap")
require("telescope").load_extension("env")
require("telescope").load_extension("coc")

local M = {}

M.git_branches = function()
    local actions = require("telescope.actions")
    require "telescope.builtin".git_branches(
        {
            attach_mappings = function(_, map)
                map("i", "<cr>", actions.git_switch_branch)
                map("n", "<cr>", actions.git_switch_branch)
                return true
            end
        }
    )
end

M.search_dotfiles = function()
    require("telescope.builtin").find_files(
        {
            prompt_title = "< Dotfiles >",
            cwd = "~/dotfiles"
        }
    )
end

M.search_ui_components = function()
    require("telescope.builtin").find_files(
        {
            prompt_title = "< UI components >",
            cwd = "~/main/backend/ui_components"
        }
    )
end

M.search_frontend = function()
    require("telescope.builtin").find_files(
        {
            prompt_title = "< Frontend >",
            cwd = "~/main/frontend/interface/npm/src"
        }
    )
end

M.search_operations = function()
    require("telescope.builtin").find_files(
        {
            prompt_title = "< Operations Server >",
            cwd = "~/main/backend/operations_server"
        }
    )
end

return M
