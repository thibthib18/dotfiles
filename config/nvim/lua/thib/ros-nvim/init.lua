local finders = require "telescope.finders"
local pickers = require "telescope.pickers"
local previewers = require "telescope.previewers"
local _, Job = pcall(require, "plenary.job")
local entry_display = require "telescope.pickers.entry_display"
local conf = require "telescope.config".values
local action_set = require "telescope.actions.set"

local function gen_from_node_name()
    local make_display = function(entry)
        if not entry then
            return nil
        end

        local columns = {
            {entry.name}
        }

        local displayer =
            entry_display.create {
            separator = " ",
            items = {
                {remaining = true}
            }
        }

        return displayer(columns)
    end

    return function(entry)
        if not entry or vim.tbl_isempty(entry) then
            return nil
        end

        return {
            value = 1,
            ordinal = entry.name,
            display = make_display,
            name = entry.name
        }
    end
end

local function node_preview()
    return previewers.new_buffer_previewer {
        title = "Node",
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
                        command = "rosnode",
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

local function entries_from_nodes(nodes)
    local entries = {}
    for _, node_name in ipairs(nodes) do
        table.insert(entries, {name = node_name})
    end
    return entries
end

local function ros_nodes(opts)
    local job =
        Job:new(
        {
            enable_recording = true,
            command = "rosnode",
            args = {"list"},
            on_exit = vim.schedule_wrap(
                function(j_self, _, _)
                    local results = j_self:result()
                    opts.preview_title = opts.preview_title or "Node Info"
                    opts.prompt_title = opts.prompt_title or "ROS Nodes"
                    opts.results_title = opts.results_title or "Nodes List"
                    pickers.new(
                        opts,
                        {
                            finder = finders.new_table {
                                results = entries_from_nodes(results),
                                entry_maker = gen_from_node_name()
                            },
                            sorter = conf.generic_sorter(opts),
                            previewer = node_preview(),
                            attach_mappings = function(_, map)
                                action_set.select:replace(
                                    function(prompt_bufnr, type)
                                        print("ok")
                                    end
                                )
                                map("i", "<c-o>", print())
                                map("i", "<c-b>", print("pr", opts.repo))
                                map("i", "<c-y>", print("pull_request"))
                                return true
                            end
                        }
                    ):find()
                end
            )
        }
    )
    job:start()
end

require "telescope".register_extension {
    exports = {
        ros_nodes = ros_nodes
    }
}

return {
    ros_nodes = ros_nodes
}
