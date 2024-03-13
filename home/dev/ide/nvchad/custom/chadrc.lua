local M = {}

M.ui = {
  ------------------------------- base46 -------------------------------------
  theme_toggle = { "catppuccin", "nightowl" },
  theme = "catppuccin",
  transparency = false,

  ------------------------------- nvchad_ui modules -----------------------------

  statusline = {
    theme = "vscode_colored",
  },
  
  tabufline = {
    show_numbers = true,
  },

  nvdash = {
    load_on_startup = true,
  }

}
  

M.plugins = "custom.plugins"

return M