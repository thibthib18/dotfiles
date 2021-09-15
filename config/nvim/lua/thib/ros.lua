local utils = require("thib.utils")

local Modes = {
    TERM = 0,
    JOB = 1
}

local mode = Modes.TERM

local function catkin_make(suffix, flags)
    flags = flags or ""
    local make_command = "catkin_make" .. (suffix or "") .. " " .. flags
    local current_bufnr = vim.fn.bufnr()
    local bufnr = vim.fn.bufnr("catkin_make")
    if bufnr ~= -1 then
        utils.go_to_buffer_id(bufnr)
    else
        utils.open_split()
    end
    local catkin_ws_path = "~/catkin_ws"
    utils.send_command_to_current_term("cd " .. catkin_ws_path, false)
    utils.send_command_to_current_term(make_command)
    utils.go_to_buffer_id(current_bufnr)
end

local function catkin_make_all_debug()
    catkin_make("_all_debug")
end

local function generate_compile_commands()
    catkin_make("_all_debug", "-DCMAKE_EXPORT_COMPILE_COMMANDS=YES")
    utils.send_command_to_current_term("mv ~/catkin_ws/build/compile_commands.json ~/main")
end

local function testF()
    vim.cmd("new")
    vim.cmd(":file " .. "testF")
    resize_split()
    vim.fn.termopen(
        "ls && zsh",
        {
            on_exit = function(job_id, code, event)
                print("ok")
                print(job_id)
                print(code)
                if code == 0 then
                    vim.notify("all good")
                end
            end
        }
    )
end

local function get_current_package_name(path)
    path = path or vim.fn.expand("%:p")
    local pkg_name = vim.fn.system('python3 -c "import rospkg;print(rospkg.get_package_name(\'' .. path .. '\'))"')
    -- clean up output
    pkg_name, _ = string.gsub(pkg_name, "\r", "")
    pkg_name, _ = string.gsub(pkg_name, "\n", "")
    if pkg_name == "None" then
        return
    end
    return pkg_name
end

local function get_current_package_path()
    local pkg_name = get_current_package_name()
    if pkg_name == nil then
        return
    end
    local pkg_path = vim.fn.system("rospack find " .. pkg_name)
    -- clean up output
    pkg_path, _ = string.gsub(pkg_path, "\r", "")
    pkg_path, _ = string.gsub(pkg_path, "\n", "")
    return pkg_path
end

local function catkin_make_pkg()
    local pkg_name = get_current_package_name()
    if pkg_name == nil then
        local path = vim.fn.expand("%:p")
        vim.notify(path .. " is not part of a ROS package", "error", {title = "catkin_make"})
        return
    end
    local suffix = " --pkg " .. pkg_name
    catkin_make(suffix)
end

local function rostest()
    local test_name = vim.fn.expand("%:t:r") .. ".test"
    -- naming convention isnt always very clear
    test_name, _ = string.gsub(test_name, "_test", "")
    local pkg_name = get_current_package_name()
    local test_command = "rostest " .. pkg_name .. " " .. test_name
    utils.open_split()
    utils.send_command_to_current_term(test_command)
end

return {
    catkin_make = catkin_make,
    catkin_make_all_debug = catkin_make_all_debug,
    catkin_make_pkg = catkin_make_pkg,
    rostest = rostest,
    testF = testF,
    generate_compile_commands = generate_compile_commands,
    get_current_package_name = get_current_package_name,
    get_current_package_path = get_current_package_path
}
