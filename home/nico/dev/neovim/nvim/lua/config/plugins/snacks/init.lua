local picker = require("config.plugins.snacks.picker")

require("snacks").setup({

  indent = {
    enabled = true,
    scope = {
      char = "¦",
      enabled = false,
    },
    animate = {
      enabled = false,
      duration = {
        step = 10,
      },
    },
    chunk = {
      enabled = true,
      corner_top = "╭",
      corner_bottom = "╰",
    },
  },

  picker = picker,
})
