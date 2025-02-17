local astal = require("astal")
local App = require("astal.gtk3.app")

local Bar = require("lua.widget.Bar.init")
local AppLauncher = require("lua.widget.Applauncher.init")

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

  end
})
