
local M = {}
M.set_cwd = function(folder_name)
  require('nvim-tree.lib').change_dir(folder_name)
end
