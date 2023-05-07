local wibox = require("wibox")

local M = {}

local RAM_PERC = wibox.widget {
	widget = wibox.widget.textbox
}

awesome.connect_signal("signal::ram", function (value, total)
	local percantage = math.floor((value/total)*100)
	RAM_PERC.text = "RAM "..percantage.."%"
end)

M.widget = RAM_PERC

return M
