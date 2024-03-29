local gears = require("gears")
local awful = require("awful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

local global = require("global")
local modkey = global.modkey
local terminal = global.terminal

local volume = require("bar.volume")

local M = {}

-- {{{ Key bindings
M.globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    -- Screen Focus
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),

    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    -- Window size increase
    awful.key({ modkey, "Mod1"   }, "k", function () awful.tag.incmwfact(0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey, "Mod1"   }, "j", function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),

    -- Layout switching
    awful.key({ modkey,           }, "t", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "t", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    -- Prompt
    awful.key({ modkey },            "r", function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"}),
    
    -- Volume control
    awful.key({}, "XF86AudioRaiseVolume",
      function()
        awful.util.spawn("pactl set-sink-volume @DEFAULT_SINK@ +2%")
      end,
      {description = "volume up", group = "audio"}
    ),
    awful.key({}, "XF86AudioLowerVolume",
      function()
        awful.util.spawn("pactl set-sink-volume @DEFAULT_SINK@ -2%")
      end,
      {description = "volume down", group = "audio"}
    ),
    awful.key({}, "XF86AudioMute",
      function()
        awful.util.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")
      end,
      {description = "volume mute toggle", group = "audio"}
    ),

    -- Screenshots 
    awful.key({ "Control", "Shift" }, "4", function() awful.util.spawn("flameshot gui --clipboard --path /home/bsaad/Pictures/Screenshots", false) end,
              {description = "Capture the region, copy to clipboard and at the same time write to file", group = "launcher"}),
     awful.key({ "Control", "Shift" }, "5", function() awful.util.spawn("flameshot screen -n 1 --clipboard --path /home/bsaad/Pictures/Screenshots", false) end,
              {description = "Capture fullscreen (main monitor), copy to clipboard and at the same time write to file", group = "launcher"}),
       
    -- Custom 
    awful.key({ modkey }, "space", function() awful.util.spawn("rofi -show drun -no-click-to-exit", false) end,
              {description = "launch rofi launcher", group = "launcher"})

)


M.clientkeys = gears.table.join(

    -- Client/Window focus
    awful.key({ modkey,           }, "h", function () awful.client.focus.global_bydirection("left") end,
              {description = "focus client left", group = "client"}),
    awful.key({ modkey,           }, "j", function () awful.client.focus.global_bydirection("down") end,
              {description = "focus client downwards", group = "client"}),
    awful.key({ modkey,           }, "k", function () awful.client.focus.global_bydirection("up") end,
              {description = "focus client upwards", group = "client"}),
    awful.key({ modkey,           }, "l", function () awful.client.focus.global_bydirection("right") end,
              {description = "focus client right", group = "client"}),

    -- Client/Window swap
    awful.key({ modkey, "Shift" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey, "Shift"  }, "h", function () awful.client.swap.global_bydirection("left") end,
              {description = "swap client left", group = "client"}),
    awful.key({ modkey, "Shift"  }, "j", function () awful.client.swap.global_bydirection("down") end,
              {description = "swap client downwards", group = "client"}),
    awful.key({ modkey, "Shift"  }, "k", function () awful.client.swap.global_bydirection("up") end,
              {description = "swap client upwards", group = "client"}),
    awful.key({ modkey, "Shift"  }, "l", function () awful.client.swap.global_bydirection("right") end,
              {description = "swap client right", group = "client"}),
    
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey,           }, "w",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),

    -- Maximize
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)


-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 5 do
    M.globalkeys = gears.table.join(M.globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

return M
