local set_cwd = function(folder_name)
    require("nvim-tree.lib").change_dir(folder_name)
end

local set_cwd_main = function()
    set_cwd("~/main")
end

return {
    set_cwd = set_cwd,
    set_cwd_main = set_cwd_main
}
