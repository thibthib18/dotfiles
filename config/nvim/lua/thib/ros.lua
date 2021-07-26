
local function send_command_to_current_term(command)
  local send_to_term = ':call jobsend(b:terminal_job_id, "' .. command .. '\\n")'
  vim.cmd(send_to_term)
end

local function catkin_make()
  local make_command = 'catkin_make'
  vim.cmd('split | terminal')
  local catkin_ws_path = '~/catkin_ws'
  send_command_to_current_term('cd ' .. catkin_ws_path)
  send_command_to_current_term(make_command)
end

local function get_package_name(path)
  local pkg_name = vim.fn.system('python3 -c "import rospkg;print(rospkg.get_package_name(\'' .. path .. '\'))"')
  -- clean up output
  pkg_name, _ = string.gsub(pkg_name, '\r', '')
  pkg_name, _ = string.gsub(pkg_name, '\n', '')
  return pkg_name
end

local function rostest()
  local path = vim.fn.expand('%:p')
  local test_name = vim.fn.expand('%:t:r') .. '.test'
  -- naming convention isnt always very clear
  test_name, _ = string.gsub(test_name, '_test', '')
  local pkg_name = get_package_name(path)
  local test_command = 'rostest ' .. pkg_name .. ' ' .. test_name
  vim.cmd('split | terminal')
  send_command_to_current_term(test_command)
end

return {
  catkin_make = catkin_make,
  rostest = rostest
}
