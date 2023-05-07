local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local utils = require("utils")

-- Signals

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", utils.set_wallpaper)

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)


client.connect_signal("focus", function(c)
	c.border_color = beautiful.border_focus
end)

client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal
end)

-- RAM 
local update_interval = 20
local ram_script = [[
	sh -c "
	free -m | grep 'Mem:' | awk '{printf \"%d@@%d@\", $7, $2}'
	"]]

awful.widget.watch(ram_script, update_interval, function(widget, stdout)
	local available = stdout:match('(.*)@@')
	local total = stdout:match('@@(.*)@')
	local used = tonumber(total) - tonumber(available)
	awesome.emit_signal("signal::ram", used, tonumber(total))
end)

-- CPU
local update_interval = 6
local cpu_idle_script = [[
	sh -c "
	vmstat 1 2 | tail -1 | awk '{printf \"%d\", $15}'
	"]]

awful.widget.watch(cpu_idle_script, update_interval, function(widget, stdout)
	local cpu_idle = stdout
	cpu_idle = string.gsub(cpu_idle, '^%s*(.-)%s*$', '%1')
	awesome.emit_signal("signal::cpu", 100 - tonumber(cpu_idle))
end)
