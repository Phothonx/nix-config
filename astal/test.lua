local astal = require("astal")
local App = require("astal.gtk3.app")
local Widget = require("astal.gtk3.widget")
local Variable = astal.Variable

local v1 = Variable(0)
local v2 = Variable(0)

local v4 = Variable.derive({ v1, v2 }, function(v1, v2)
    return v1 * v2
end)

App:start({
  instance_name = "astal-lua-test",
  main = function()

  end,
})


