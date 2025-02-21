local astal = require("astal")
local Widget = require("astal.gtk3.widget")
local Anchor = require("astal.gtk3").Astal.WindowAnchor

local BrightnessOsd = require("lua.widget.osd.brighness")
local VolumeOsd = require("lua.widget.osd.volume")

return function ()
  return Widget.Window({
    namespace = "osd",
    name = "osd",
    class_name = "Osd",
    anchor = Anchor.RIGHT,
    Widget.Box({
      BrightnessOsd(),
      VolumeOsd(),
    })
  })
end
