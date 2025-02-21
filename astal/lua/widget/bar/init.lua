local Widget = require("astal.gtk3.widget")

local Time = require("lua.widget.bar.time")
local Workspaces = require("lua.widget.bar.workspaces")
local Wifi = require("lua.widget.bar.wifi")
local Battery = require("lua.widget.bar.battery")
local SysTray = require("lua.widget.bar.systray")
local Audio = require("lua.widget.bar.audio")
local FocusedCLient = require("lua.widget.bar.focused")
local Mode = require("lua.widget.bar.mode")

return function(gdkmonitor)
  local Anchor = require("astal.gtk3").Astal.WindowAnchor
  local windowname = string.format("bar-%d", gdkmonitor.display:get_n_monitors())

  return Widget.Window({
    -- margin_top = 8;
    -- margin_left = 8;
    -- margin_right = 8;
    name = windowname,
    namespace = windowname,
    class_name = "Bar",
    gdkmonitor = gdkmonitor,
    anchor = Anchor.TOP + Anchor.LEFT + Anchor.RIGHT,
    height_request = 26;
    exclusivity = "EXCLUSIVE",
    Widget.CenterBox({
      Widget.Box({
        halign = "START",
        Mode(),
        Workspaces(),
        FocusedCLient(),
      }),

      Widget.Box({
      }),

      Widget.Box({
        halign = "END",
        Time("%H:%M | %a %d %b"),
        Wifi(),
        Audio(),
        Battery(),
        SysTray(),
      }),

    }),
  })
end
