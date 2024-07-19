return {
  {
    "rcarriga/nvim-notify",
    name = "notify",

    lazy = false,

    config = function (_, opts)
      require("notify").setup()
    end,

    opts = {}
  }
}
