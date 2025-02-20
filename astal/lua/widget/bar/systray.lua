local astal = require("astal")
local Widget = require("astal.gtk3.widget")
local bind = astal.bind
local Tray = astal.require("AstalTray")

local map = require("lua.lib").map

local trayButton = function(item)
  return Widget.MenuButton({
    class_name = "TrayItem";
    tooltip_markup = bind(item, "tooltip_markup"),
    use_popover = false,
    menu_model = bind(item, "menu-model"),
    action_group = bind(item, "action-group"):as(function(ag)
      return { "dbusmenu", ag }
    end),
    Widget.Icon({
      gicon = bind(item, "gicon"),
    }),
  })
end

return function()
  local tray = Tray.get_default()

  return Widget.Box({
    visible = bind(tray, "items"):as(function (items)
      return #items ~= 0
    end),
    class_name = "SysTray",
    bind(tray, "items"):as(function(items)
      return map(items, trayButton)
		end),
	})
end
