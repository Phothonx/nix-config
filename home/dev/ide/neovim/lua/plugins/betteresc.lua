return {
  {
    "better-escape.nvim",

    event = "InsertEnter",

    keys = {
      { "jk", mode = "i", desc = "Fast escape" },
      { "jj", mode = "i", desc = "Fast escape" },
    },

    after = function()
      require("better_escape").setup()
    end,
  }
}
