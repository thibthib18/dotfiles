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

M.search_workflow_automation = function()
    require("telescope.builtin").find_files(
        {
            prompt_title = "< Workflow Automation >",
            cwd = "~/main/backend/workflow_automation"
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

local function visual_selection_range()
    local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
    local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))
    if csrow < cerow or (csrow == cerow and cscol <= cecol) then
        return csrow - 1, cscol - 1, cerow - 1, cecol
    else
        return cerow - 1, cecol - 1, csrow - 1, cscol
    end
end

local function get_visual_selection()
    local row_start, col_start, row_end, col_end = visual_selection_range()
    if row_start ~= row_end then
        print("get_visual_selection only works for 1 line selection")
        return ""
    end
    local bufnr = vim.api.nvim_get_current_buf()
    local current_line = vim.api.nvim_get_current_line()
    return current_line:sub(col_start + 1, col_end)
end

M.grep_current_selection = function()
    local selected_text = get_visual_selection()
    require("telescope.builtin").live_grep(
        {
            default_text = selected_text
        }
    )
end

return M
