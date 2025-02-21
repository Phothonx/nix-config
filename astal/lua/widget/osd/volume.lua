local astal = require("astal")
local Widget = require("astal.gtk3.widget")
local bind = astal.bind
local Variable = astal.Variable
local timeout = astal.timeout
local Wp = astal.require("AstalWp")

local visible = Variable(false)

local set_timer = function() return timeout(2000, function () visible:set(false) end) end
local timer = set_timer()


return function ()
  local speaker = Wp.get_default().audio.default_speaker

  return Widget.Revealer({
    reveal_child = bind(visible);
    transition_type = "SLIDE_RIGHT",
    transition_duration = 400,
    Widget.Box({
      class_name = "VolumeOsd",
      vertical = true,
      height_request = 350,
      width_request = 40,
      visible = true, -- bind(visible),
      margin_right = 12,
      Widget.LevelBar({
        expand = true,
        vertical = true,
        inverted = true,
        max_value = 110,
        min_value = 0,
        value = bind(speaker, "volume"):as(function (v)
          timer:cancel()
          visible:set(true)
          timer = set_timer()
          return v*100
        end);
      }),
      Widget.Icon({
        halign = "CENTER",
        valign = "CENTER",
        icon = "folder-music-symbolic",
      }),
    }),
  })
end
