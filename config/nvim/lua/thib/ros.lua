

local function resize_split(height)
  vim.cmd('resize ' .. (height or vim.g.make_split_height))
end

local function open_split()
  vim.cmd('split | terminal')
  resize_split()
end

local function send_command_to_current_term(command)
  local send_to_term = ':call jobsend(b:terminal_job_id, "' .. command .. '\\n")'
  vim.cmd(send_to_term)
end

local function catkin_make(suffix)
  local make_command = 'catkin_make' .. (suffix or "")
  open_split()
  local catkin_ws_path = '~/catkin_ws'
  send_command_to_current_term('cd ' .. catkin_ws_path)
  send_command_to_current_term(make_command)
end

local function catkin_make_all_debug()
  catkin_make('_all_debug')
end

local function get_current_package_name(path)
  path = path or vim.fn.expand('%:p')
  local pkg_name = vim.fn.system('python3 -c "import rospkg;print(rospkg.get_package_name(\'' .. path .. '\'))"')
  -- clean up output
  pkg_name, _ = string.gsub(pkg_name, '\r', '')
  pkg_name, _ = string.gsub(pkg_name, '\n', '')
  return pkg_name
end

local function catkin_make_pkg()
  local pkg_name = get_current_package_name()
  if pkg_name == nil then
    local path = vim.fn.expand('%:p')
    print(path .. ' is not part of a ROS package')
    return
  end
  local suffix = ' --pkg ' .. pkg_name
  catkin_make(suffix)
end

local function rostest()
  local test_name = vim.fn.expand('%:t:r') .. '.test'
  -- naming convention isnt always very clear
  test_name, _ = string.gsub(test_name, '_test', '')
  local pkg_name = get_current_package_name()
  local test_command = 'rostest ' .. pkg_name .. ' ' .. test_name
  open_split()
  send_command_to_current_term(test_command)
end

return {
  catkin_make = catkin_make,
  catkin_make_all_debug = catkin_make_all_debug,
  catkin_make_pkg = catkin_make_pkg,
  rostest = rostest,
  open_split = open_split,
}