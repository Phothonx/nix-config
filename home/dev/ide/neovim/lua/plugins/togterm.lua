return {
   {
    "toggleterm.nvim",

    cmd = "ToggleTerm";

    keys = {
      { "<leader>t", "<CMD>ToggleTerm<CR>", desc = "Toggle terminal" },
    },

    after = function ()
      require("toggleterm").setup()
    end,
  }
}
