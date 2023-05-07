local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local utils = require("utils")
local global = require("global")

local taglist = require("bar.taglist")

local time_widget = wibox.widget.textclock("%H:%M - %a %b %d")
local volume = require("bar.volume")
local logout_menu_widget = require("awesome-wm-widgets.logout-menu-widget.logout-menu")
local calendar = require("bar.calendar")
local sysinfo = require("bar.sysinfo")

time_widget:connect_signal("button::press",
    function(_, _, _, button)
        if button == 1 then calendar.widget.toggle() end
    end)

local wrap_widget = function(widget)
  return wibox.widget({
    {
      widget,
      left = beautiful.spacing_lg,
      right = beautiful.spacing_lg,
      top = beautiful.spacing,
      bottom = beautiful.spacing,
      widget = wibox.container.margin,
    },
    shape = gears.shape.rounded_rect,
    bg = beautiful.bg_normal,
    widget = wibox.container.background,
  })
end

local wrap_widget_sm = function(widget)
  return wibox.widget({
    {
      widget,
      left = beautiful.spacing,
      right = beautiful.spacing,
      top = beautiful.spacing_sm,
      bottom = beautiful.spacing_sm,
      widget = wibox.container.margin,
    },
    shape = gears.shape.rounded_rect,
    bg = beautiful.bg_normal,
    widget = wibox.container.background,
  })
end

awful.screen.connect_for_each_screen(function(s)
  s.mytaglist = taglist.create_taglist_widget(s)

  s.mywibox = awful.wibar({
    height = beautiful.bar_height,
    type = "dock",
    bg = "#0000000", -- transparent background
    position = "top",
    screen = s,
  })

  s.mywibox:setup({
    {
      layout = wibox.layout.stack,
      {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
          layout = wibox.layout.fixed.horizontal,
          wrap_widget(s.mytaglist),
        },
        nil,
        { -- Right widgets
          layout = wibox.layout.fixed.horizontal,
          spacing = beautiful.spacing,
          wrap_widget(sysinfo.widget),
          wrap_widget(volume.widget),
          wrap_widget_sm(logout_menu_widget()),
        },
        widget = wibox.container.margin,
      },
      {
        wrap_widget(time_widget),
        valign = "center",
        halign = "center",
        layout = wibox.container.place,
      },
    },
    left = beautiful.useless_gap * 2,
    right = beautiful.useless_gap * 2,
    top = beautiful.useless_gap * 2,
    widget = wibox.container.margin,
  })
  end
)

  

