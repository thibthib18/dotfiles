
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "tmux/plugins/*", "node_modules/*", "third_party"},
  }
}

local M = {}
M.search_ui_components = function()
  require("telescope.builtin").find_files({
    prompt_title = "< UI components >",
    cwd = "~/main/backend/ui_components",
  })
end

return M
