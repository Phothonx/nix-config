local astal = require("astal")
local Widget = require("astal.gtk3.widget")

return function ()
  return Widget.Label({
    class_name = "Mode",
    label = "Normal",
  })
end
