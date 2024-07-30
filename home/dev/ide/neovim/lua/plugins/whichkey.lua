return {
  {
    "which-key.nvim",

    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },

    event = "User DeferredUIEnter";

    after = function ()
      require("which-key").setup()
    end,
  }
}
