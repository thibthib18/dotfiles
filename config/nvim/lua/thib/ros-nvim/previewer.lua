local _, Job = pcall(require, "plenary.job")
local previewers = require "telescope.previewers"

local function info_preview(command)
    return previewers.new_buffer_previewer {
        get_buffer_by_name = function(_, entry)
            return entry.name
        end,
        define_preview = function(self, entry)
            local bufnr = self.state.bufnr
            if self.state.bufname ~= entry.name or vim.api.nvim_buf_line_count(bufnr) == 1 then
                local job =
                    Job:new(
                    {
                        enable_recording = true,
                        command = command,
                        args = {"info", entry.name},
                        on_exit = vim.schedule_wrap(
                            function(j_self, _, _)
                                local result = j_self:result()
                                vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, result)
                            end
                        )
                    }
                )
                job:start()
            end
        end
    }
end

return {
    info_preview = info_preview
}
