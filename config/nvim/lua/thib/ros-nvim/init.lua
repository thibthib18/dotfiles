local pickers = require "thib.ros-nvim.picker"

require "telescope".register_extension {
    exports = {
        node_picker = pickers.node_picker,
        topic_picker = pickers.topic_picker,
        service_picker = pickers.service_picker
    }
}

return {
    node_picker = pickers.node_picker,
    topic_picker = pickers.topic_picker,
    service_picker = pickers.service_picker
}
