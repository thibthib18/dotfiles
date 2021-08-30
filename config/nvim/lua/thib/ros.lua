local Modes = {
    TERM = 0,
    JOB = 1
}

local mode = Modes.TERM

local function resize_split(height)
    vim.cmd("resize " .. (height or vim.g.make_split_height))
end

local function open_terminal()
    vim.cmd("terminal")
end

local function open_split(with_terminal)
    with_terminal = with_terminal == nil and true or with_terminal
    vim.cmd("split")
    if with_terminal then
        open_terminal()
    end
    resize_split()
end

local function send_command_to_current_term(command, autoscroll, name)
    local send_to_term = ':call jobsend(b:terminal_job_id, "' .. command .. '\\n")'
    name = name or command
    vim.cmd(":file " .. name)
    vim.cmd(send_to_term)
    if autoscroll ~= false then
        vim.cmd(":normal! G")
    end
end

local function execute_current_file()
    path = path or vim.fn.expand("%:p")
    filename = vim.fn.expand("%:t")
    open_split()
    send_command_to_current_term(path, true, "exec " .. filename)
end

local function catkin_make(suffix, flags)
    flags = flags or ""
    local make_command = "catkin_make" .. (suffix or "") .. " " .. flags
    open_split()
    local catkin_ws_path = "~/catkin_ws"
    send_command_to_current_term("cd " .. catkin_ws_path, false)
    send_command_to_current_term(make_command)
end

local function catkin_make_all_debug()
    catkin_make("_all_debug")
end

local function generate_compile_commands()
    catkin_make("_all_debug", "-DCMAKE_EXPORT_COMPILE_COMMANDS=YES")
    send_command_to_current_term("mv ~/catkin_ws/build/compile_commands.json ~/main")
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
    return pkg_name
end

local function get_current_package_path()
    local pkg_name = get_current_package_name()
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
        print(path .. " is not part of a ROS package")
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
    open_split()
    send_command_to_current_term(test_command)
end

return {
    catkin_make = catkin_make,
    catkin_make_all_debug = catkin_make_all_debug,
    catkin_make_pkg = catkin_make_pkg,
    rostest = rostest,
    open_split = open_split,
    testF = testF,
    generate_compile_commands = generate_compile_commands,
    execute_current_file = execute_current_file,
    get_current_package_name = get_current_package_name,
    get_current_package_path = get_current_package_path
}
