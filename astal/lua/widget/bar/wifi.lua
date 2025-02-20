local astal = require("astal")
local Widget = require("astal.gtk3.widget")
local bind = astal.bind
local Network = astal.require("AstalNetwork")

return function()
	local wifi = Network.get_default().wifi

	return Widget.Box({
    class_name = "Wifi",
    Widget.Icon({
      class_name = "icon",
      icon = bind(wifi, "icon-name")
    }),
    Widget.Label({
      label = bind(wifi, "ssid"):as(tostring)
    }),
	})
end
