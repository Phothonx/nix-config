local astal = require("astal")
local Anchor = require("astal.gtk3").Astal.WindowAnchor
local Widget = require("astal.gtk3.widget")
local exec = astal.exec
local map = require("lua.lib").map
local App = require("astal.gtk3.app")

local out, _ = exec("find /home/nico/.dotfiles/wallpapers/")

local function castThisFuckingIteratorIntoATablePls(iterator)
  local result = {}
  for path in iterator do
    if path:sub(-1) ~= "/" and path:sub(-2) ~= "md" then table.insert(result, path) end -- trash non files
  end
  return result
end

local function hide()
	local selector = App:get_window("selector")
	if selector then selector:hide() end
end

local filePaths = castThisFuckingIteratorIntoATablePls(string.gmatch(out, "[^\n]+"))

local function fileButton(filePath)
  return Widget.Button({
    class_name = "FileButton",
    on_click = function ()
      exec("swww img " .. filePath .. " --transition-type=grow --transition-duration=1")
      print("changing wallpaper to " .. filePath)
      hide()
    end,
    Widget.Box({
      Widget.Label({
        class_name = "name",
        label = filePath,
      })
    })
  })
end


return function ()
  return Widget.Window({
    name = "selector",
    application = App,
    anchor = Anchor.TOP,
    visible = false,
    Widget.Box({
      vertical = true,
      map(filePaths, fileButton)
    }),
  })
end
