return {
  {
    "leap.nvim",

    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },

    after = function()
      require("leap").setup({
        case_sensitive = false,
      })
      require('leap').create_default_mappings()
    end,
  }
}
