
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "venv/*", "tmux/plugins/*", "node_modules/*", "third_party"},
  }
}
require('telescope').load_extension('fzy_native')

local M = {}
M.search_ui_components = function()
  require("telescope.builtin").find_files({
    prompt_title = "< UI components >",
    cwd = "~/main/backend/ui_components",
  })
end

return M
