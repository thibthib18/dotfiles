local set_cwd = function(folder_name)
    require("nvim-tree.lib").change_dir(folder_name)
end

local set_cwd_main = function()
    set_cwd("~/main")
end

local set_cwd_current_file = function()
    path = path or vim.fn.expand("%:p:h")
    set_cwd(path)
end

local tros = require("thib.ros")

local set_cwd_current_package = function()
    pkg_name = tros.get_current_package_name()
    pkg_path = vim.fn.system("rospack find " .. pkg_name)
    set_cwd(pkg_path)
end

return {
    set_cwd_current_file = set_cwd_current_file,
    set_cwd_main = set_cwd_main,
    set_cwd_current_package = set_cwd_current_package
}
