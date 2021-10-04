local finders = require "telescope.finders"
local pickers = require "telescope.pickers"
local _, Job = pcall(require, "plenary.job")
local conf = require "telescope.config".values
local action_set = require "telescope.actions.set"
local ros_previewers = require "thib.ros-nvim.previewer"
local utils = require "thib.ros-nvim.helpers"

local function info_picker(opts)
    local job =
        Job:new(
        {
            enable_recording = true,
            command = opts.command,
            args = {"list"},
            on_exit = vim.schedule_wrap(
                function(j_self, _, _)
                    local results = j_self:result()
                    local picker_opts = {}
                    picker_opts.preview_title = opts.preview_title or "Info"
                    picker_opts.prompt_title = opts.prompt_title or ""
                    picker_opts.results_title = opts.results_title or "List"
                    pickers.new(
                        picker_opts,
                        {
                            finder = finders.new_table {
                                results = utils.gen_entries(results),
                                entry_maker = utils.gen_from_name()
                            },
                            sorter = conf.generic_sorter(picker_opts),
                            previewer = ros_previewers.info_preview(opts.command),
                            attach_mappings = function(_, map)
                                action_set.select:replace(
                                    function(prompt_bufnr, type)
                                        print("ok")
                                    end
                                )
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

local function node_picker()
    local opts = {
        command = "rosnode",
        preview_title = "Node Info",
        prompt_title = "ROS Nodes",
        results_title = "Nodes List"
    }
    info_picker(opts)
end

local function topic_picker()
    local opts = {
        command = "rostopic",
        preview_title = "Topic Info",
        prompt_title = "ROS Topics",
        results_title = "Topics List"
    }
    info_picker(opts)
end

local function service_picker()
    local opts = {
        command = "rosservice",
        preview_title = "Service Info",
        prompt_title = "ROS Services",
        results_title = "Services List"
    }
    info_picker(opts)
end

local function srv_picker()
    local opts = {
        command = "rossrv",
        preview_title = "Service Info",
        prompt_title = "ROS Services",
        results_title = "Services List"
    }
    info_picker(opts)
end

local function msg_picker()
    local opts = {
        command = "rosmsg",
        preview_title = "Message Info",
        prompt_title = "ROS Messages",
        results_title = "Messages List"
    }
    info_picker(opts)
end

return {
    node_picker = node_picker,
    topic_picker = topic_picker,
    service_picker = service_picker,
    msg_picker = msg_picker,
    srv_picker = srv_picker
}
