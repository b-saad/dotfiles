local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local utils = require("utils")
local global = require("global")

local M = {}

local taglist_buttons = gears.table.join(
  awful.button({ }, 1, function(t) t:view_only() end),
  awful.button({ modkey }, 1, function(t)
                            if client.focus then
                                client.focus:move_to_tag(t)
                            end
                        end),
  awful.button({ }, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, function(t)
                            if client.focus then
                                client.focus:toggle_tag(t)
                            end
                        end),
  awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
  awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

M.create_taglist_widget = function(s)
  return awful.widget.taglist({
    screen = s,
    buttons = taglist_buttons,
    filter = awful.widget.taglist.filter.all,
    layout = {
      layout = wibox.layout.fixed.horizontal,
      spacing = beautiful.spacing,
    },
    style = { shape = gears.shape.circle },
    widget_template = {
      {
        left = beautiful.spacing,
        right = beautiful.spacing,
        widget = wibox.container.margin,
      },
      id = "background_role",
      widget = wibox.container.background,
    },
  })
end

return M
