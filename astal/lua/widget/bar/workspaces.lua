local astal = require("astal")
local Widget = require("astal.gtk3.widget")
local bind = astal.bind
local Hyprland = astal.require("AstalHyprland")

-- local map = require("lua.lib").map

local function filter(array, func)
  local new_arr = {}
  for i, v in ipairs(array) do
    if func(i, v) then
      table.insert(new_arr, v) end
  end
  return new_arr
end


return function()
  local hypr = Hyprland.get_default()

  -- local wsButton = function(ws)
  --   if not (ws.id >= -99 and ws.id <= -2) then -- filter out special workspaces
  --     return Widget.Button({
  --       class_name = bind(hypr, "focused-workspace"):as(
  --       function(fw) return fw == ws and "focused" or "" end
  --       ),
  --       on_clicked = function() ws:focus() end,
  --       label = tostring(ws.id),
  --       valign = "CENTER",
  --       halign = "CENTER",
  --     })
  --   end
  -- end

  return Widget.Box({
    class_name = "Workspaces",
    Widget.Label({
      setup = function(self)
        self:hook(hypr, "event", function()
          local active = tostring(hypr.focused_workspace.id)
          local wss = filter(hypr.workspaces, function (i, v)
            return v.id > 0
          end)
          local highest, lowest
          if #wss > 1 then
            table.sort(wss, function(a, b) return a.id < b.id end)
            highest = tostring(wss[#wss].id)
            lowest = tostring(wss[1].id)
          else
            highest = active
            lowest = active
          end
          self.label = active .. " | " .. lowest .. "-" .. highest
        end)
      end,
    })

    -- bind(hypr, "workspaces"):as(function(wss)
    --   table.sort(wss, function(a, b) return a.id < b.id end)
    --   return map(wss, wsButton)
    -- end),
  })
end
