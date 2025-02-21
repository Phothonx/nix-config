local astal = require("astal")
local Widget = require("astal.gtk3.widget")
local bind = astal.bind
local Variable = astal.Variable
local timeout = astal.timeout

local visible = Variable(false)
local set_timer = function() return timeout(2000, function () visible:set(false) end) end
local timer = set_timer()

local function readbr(file)
  return tonumber(astal.read_file("/sys/class/backlight/intel_backlight/" .. file))
end

local maxbr = readbr("max_brightness")
local br = Variable(readbr("brightness"))
astal.monitor_file("/sys/class/backlight/intel_backlight/brightness", function (file, event)
  br:set(readbr("brightness"))
end)

return function ()
  return Widget.Box({
    class_name = "BrightnessOsd",
    vertical = true,
    height_request = 350,
    width_request = 40,
    visible = bind(visible),
    margin_right = 12,
    Widget.LevelBar({
      expand = true,
      vertical = true,
      inverted = true,
      max_value = 100,
      min_value = 0,
      value = bind(br, "value"):as(function (v)
        timer:cancel()
        visible:set(true)
        timer = set_timer()
        return v/maxbr*100
      end);
    }),
    Widget.Icon({
      halign = "CENTER",
      valign = "CENTER",
      icon = "weather-clear-symbolic",
    })
  })
end
