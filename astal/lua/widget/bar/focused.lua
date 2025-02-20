local astal = require("astal")
local Widget = require("astal.gtk3.widget")
local bind = astal.bind
local Hyprland = astal.require("AstalHyprland")

return function()
  local hypr = Hyprland.get_default()

  return Widget.Box({
    class_name = "FocusedClient",
    Widget.Label({
      setup = function(self)
        self:hook(hypr, "event", function()
          local c = hypr.focused_client
          if c then
            self.label = c.initial_class
          else
            self.label = string.format("Workspace %d", hypr.focused_workspace.id)
          end
        end)
      end,
    }),
  })
end
