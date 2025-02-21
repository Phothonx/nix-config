local astal = require("astal")
local Widget = require("astal.gtk3.widget")

-- TODO
-- hot mode
-- media playing mode
-- low power mode
-- idle inhibit ?
-- silent notifications mode ?

-- mode priority or alternance

return function ()
  return Widget.Label({
    class_name = "Mode",
    label = "Normal",
  })
end
