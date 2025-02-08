local picker = require("config.plugins.snacks.picker")

require("snacks").setup({

  indent = {
    enabled = true,
      char = "", -- "¦"
    scope = {
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

  explorer = {
    enabled = true,
    replace_netrw = true,
  },

  picker = picker,
})
