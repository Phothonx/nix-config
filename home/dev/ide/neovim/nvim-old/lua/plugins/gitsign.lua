return {
  {
    "lewis6991/gitsigns.nvim",

    event = "User FilePost",

    config = function (_, opts)
      require("gitsigns").setup(opts)
    end,

    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },
    }
  }
}
