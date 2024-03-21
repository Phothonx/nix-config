return {
  {
    "max397574/better-escape.nvim",

    keys = { 
      { "jk", mode = "i", desc = "Fast escape" },
      { "jj", mode = "i", desc = "Fast escape" },
    },

    config = function()
      require("better_escape").setup()
    end,

    opts = {
      mapping = {"jk", "jj"},
      keys = "<Esc>", 
    }
  }
}
