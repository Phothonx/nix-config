local astal = require("astal")
local Widget = require("astal.gtk3.widget")
local bind = astal.bind
local Wp = astal.require("AstalWp")

return function()
	local speaker = Wp.get_default().audio.default_speaker

	return Widget.Box({
      class_name = "Volume";
      Widget.Icon({
        class_name = "icon",
        icon = bind(speaker, "volume-icon"),
      }),
      Widget.Label({
        label = bind(speaker, "volume"):as(function(v)
          return string.format("%.0f%%", v * 100)
        end),
      }),
    })
end
