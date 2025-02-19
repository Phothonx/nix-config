local astal = require("astal")
local App = require("astal.gtk3.app")

local Bar = require("lua.widget.Bar.init")
local AppLauncher = require("lua.widget.Applauncher.init")
local VolumeOsd = require("lua.widget.osd.init")
local WallSelector = require("lua.widget.wallselector.init")

local scss = "./style.scss"
local css = "/tmp/style.css"
astal.exec("sass " .. scss .. " " .. css)

App:start({
  instance_name = "astal-lua",
  css = css,
  main = function()

		for _, monitor in pairs(App.monitors) do
			Bar(monitor)
		end

    AppLauncher()
    VolumeOsd()
    WallSelector()

  end
})

-- https://docs.gtk.org/gtk3/class.Widget.html#methods
-- https://aylur.github.io/astal/guide/libraries/
-- https://aylur.github.io/libastal/astal3/index.html#classes
