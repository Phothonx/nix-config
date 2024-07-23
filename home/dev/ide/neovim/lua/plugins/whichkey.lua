return {
  {
    "which-key.nvim",

    event = "User DeferredUIEnter";

    after = function ()
      require("which-key").setup()
    end,
  }
}
