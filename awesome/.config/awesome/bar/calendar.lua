local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")

local M = {}

M.widget = calendar_widget({
    placement = "top_center",
    start_sunday = true,
})

return M
