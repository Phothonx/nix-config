local Widget = require("astal.gtk3.widget")

local Time = require("lua.widget.Bar.time")
local Workspaces = require("lua.widget.Bar.workspaces")
local Wifi = require("lua.widget.Bar.wifi")
local Battery = require("lua.widget.Bar.battery")
local SysTray = require("lua.widget.Bar.systray")
local Audio = require("lua.widget.Bar.audio")

return function(gdkmonitor)
  local Anchor = require("astal.gtk3").Astal.WindowAnchor

  return Widget.Window({
    class_name = "Bar",
    gdkmonitor = gdkmonitor,
    anchor = Anchor.TOP + Anchor.LEFT + Anchor.RIGHT,
    exclusivity = "EXCLUSIVE",
    Widget.CenterBox({

      Widget.Box({
        halign = "START",
        Workspaces(),
      }),

      Widget.Box({
        Time("%H • %M  |  %a %d %b"),
      }),

      Widget.Box({
        class_name = "Settings",
        halign = "END",
        Wifi(),
        Audio(),
        Battery(),
        SysTray(),
      }),

    }),
  })
end
