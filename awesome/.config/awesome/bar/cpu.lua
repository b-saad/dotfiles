local wibox = require("wibox")
local beautiful = require("beautiful")

local M = {}

local CPU_PERC = wibox.widget {
	widget = wibox.widget.textbox
}

awesome.connect_signal("signal::cpu", function (value)
	CPU_PERC.text = "CPU "..value.."%"
end)

M.widget = CPU_PERC

return M
