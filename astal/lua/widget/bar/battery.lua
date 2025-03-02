local astal = require("astal")
local Widget = require("astal.gtk3.widget")
local bind = astal.bind
local Variable = astal.Variable
local Battery = astal.require("AstalBattery")

local scroll = Variable(0)

return function()
	local bat = Battery.get_default()
  local per = bind(bat, "percentage")
  local label = Variable.derive({ per, scroll }, function(p, s)
    return (tostring(math.floor(p * 100) + math.floor(s)) .. "%")
  end)

	return Widget.Box({
		class_name = "Battery",
		visible = bind(bat, "is-present"),
		Widget.Icon({
      class_name = "icon",
			icon = bind(bat, "battery-icon-name"),
		}),
    Widget.EventBox({
        on_scroll = function (_, event)
          scroll:set(scroll:get() + event.delta_y)
        end,
        on_click = function (_, event)
          scroll:set(0)
        end,
      Widget.Label({
        label = bind(label),
      }), -- magic battery effect
    }),
	})
end
