local astal = require("astal")
local App = require("astal.gtk3.app")

local Bar = require("lua.widget.bar.init")
local Launcher = require("lua.widget.launcher.init")
local Osd = require("lua.widget.osd.init")
local Notifications = require("lua.widget.notifications.init")

local scss = "./style.scss"
local css = "/tmp/style.css"
astal.exec("sass " .. scss .. " " .. css)

App:start({
  instance_name = "astal-lua",
  css = css,
  main = function()

		for _, gdkmonitor in pairs(App.monitors) do
			Bar(gdkmonitor)
      Notifications(gdkmonitor)
		end

    Launcher()
    Osd()

  end,
})

-- https://docs.gtk.org/gtk3/class.Widget.html#methods
-- https://aylur.github.io/astal/guide/libraries/
-- https://aylur.github.io/libastal/astal3/index.html#classes
