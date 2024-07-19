return {
  {
    "ggandor/leap.nvim",

    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },

    config = function(_, opts)
      require("leap").setup(opts)
      require('leap').create_default_mappings()
    end,

    opts = {
      case_sensitive = false,
    }
  }
}
