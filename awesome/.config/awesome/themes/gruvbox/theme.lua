local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gears = require("gears")
local gfs = require("gears.filesystem")
local naughty = require("naughty")
local globals = require("global")
local utils = require("utils")

local theme = {}

theme.transparent = "#00000000"
theme.font = "FiraMono Nerd Font Mono 11"
--
-- Gruvbox-Material Hard Colors
theme.lightred    = "#ea6962"
theme.red         = "#ea6962"
theme.lightorange = "#e78a4e"
theme.orange      = "#e78a4e"
theme.lightyellow = "#d8a657"
theme.yellow      = "#d8a657"
theme.lightgreen  = "#a9b665"
theme.green       = "#a9b665"
theme.lightaqua   = "#89b482"
theme.aqua        = "#89b482"
theme.lightblue   = "#7daea3"
theme.blue        = "#7daea3"
theme.lightpurple = "#d3869b"
theme.purple      = "#d3869b"
theme.fg0         = "#fbf1c7"
theme.fg1         = "#ebdbb2"
theme.fg2         = "#d5c4a1"
theme.fg3         = "#bdae93"
theme.fg4         = "#a89984"
theme.gray        = "#928374"
theme.bg4         = "#7c6f64"
theme.bg3         = "#665c54"
theme.bg2         = "#504945"
theme.bg1         = "#3c3836"
theme.bg0_s       = "#32302f"
theme.bg0         = "#282828"
theme.bg0_h       = "#1d2021"

-- Colors
theme.bg_normal  = theme.bg0
theme.bg_focus   = theme.bg1
theme.bg_urgent  = theme.bg0
theme.bg_systray = theme.bg0

theme.fg_normal  = theme.fg4
theme.fg_focus   = theme.fg1
theme.fg_urgent  = theme.lightorange

--  Borders
theme.useless_gap       = dpi(5)
theme.gap_single_client = true
theme.border_width      = dpi(2)
theme.border_normal     = theme.bg2
theme.border_focus      = theme.fg1
theme.border_marked     = theme.lightpurple

-- Taglist
theme.taglist_fg_empty    = theme.bg3
theme.taglist_fg_occupied = theme.bg0
theme.taglist_fg_focus    = theme.bg0
theme.taglist_fg_urgent   = theme.bg0
theme.taglist_fg_volatile = theme.bg0
theme.taglist_bg_focus    = theme.lightaqua
theme.taglist_bg_urgent   = theme.lightorange
theme.taglist_bg_occupied = theme.red
theme.taglist_bg_volatile = theme.lightpurple
theme.taglist_bg_empty    = theme.bg1
theme.taglist_bg_hover    = theme.lightpurple

-- wallpaper
theme.wallpaper = gears.surface.load_uncached(gfs.get_configuration_dir()  .. "themes/gruvbox/gruv-sushi-streets.jpg")

-- -- bar
theme.bar_height = dpi(45)

-- spacing
theme.spacing_sm = dpi(4)
theme.spacing = dpi(8)
theme.spacing_md = dpi(12)
theme.spacing_lg = dpi(16)
theme.spacing_xl = dpi(29)

-- system tray
theme.systray_icon_spacing = theme.spacing
theme.systray_max_rows = 7



-- ********************************* --
--
--              Naughty
--
-- ********************************* --
--
-- local nc = naughty.config
-- nc.defaults.margin = theme.spacing_lg
-- nc.defaults.shape = utils.ui.rounded_rect()
-- nc.defaults.timeout = 5
-- nc.padding = theme.spacing
-- nc.padding = theme.spacing_xl
-- nc.presets.critical.bg = theme.red
-- nc.presets.critical.fg = theme.bg0
-- nc.presets.low.bg = theme.bg0
-- nc.presets.normal.bg = theme.green
-- nc.presets.normal.fg = theme.bg0
-- nc.spacing = theme.spacing
--

return theme
