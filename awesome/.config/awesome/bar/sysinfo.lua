local wibox = require("wibox")
local beautiful = require("beautiful")

-- Sysinfo is a horizontal stack of the system info widgets (CPU, RAM etc...)
local cpu = require("bar.cpu")
local ram = require("bar.ram")

local M = {}

M.widget = wibox.widget {
  cpu.widget,
  ram.widget,
  spacing = beautiful.spacing_lg,
  layout = wibox.layout.fixed.horizontal
}

return M
