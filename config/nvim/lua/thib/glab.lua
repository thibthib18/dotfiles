local utils = require("thib.utils")
local _, Job = pcall(require, "plenary.job")

local function get_current_line_commit(path)
    path = vim.fn.expand("%:p")
    local line_number = vim.api.nvim_win_get_cursor(0)[1]
    local command = "git --no-pager log -L" .. line_number .. ",+1:'" .. path .. "' --pretty=format:'%H'"
    local output = vim.fn.system(command)
    -- clean up output
    return output:gmatch("([^\n]*)\n?")()
end

local function get_current_line_mr()
    local commit_id = get_current_line_commit()
    local line_number = vim.api.nvim_win_get_cursor(0)[1] - 1
    local ns = vim.api.nvim_create_namespace("MR")
    local job =
        Job:new(
        {
            enable_recording = true,
            command = "/home/sv/main/tools/development/dev_tool/glab/glab.py",
            args = {commit_id},
            on_exit = vim.schedule_wrap(
                function(j_self, _, _)
                    local result = j_self:result()
                    if next(result) ~= nil then
                        vim.api.nvim_buf_set_extmark(0, ns, line_number, 0, {virt_text = {{result[1], "Comment"}}})
                    end
                end
            )
        }
    )
    job:start()
end

return {
    get_current_line_mr = get_current_line_mr
}
