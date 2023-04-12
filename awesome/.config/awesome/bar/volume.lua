local volume_widget = require('awesome-wm-widgets.pactl-widget.volume')

local M = {}

M.widget = volume_widget {
  widget_type = "icon_and_text",
  step = "2",
}

return M
