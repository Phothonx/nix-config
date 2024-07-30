return {
   {
    "toggleterm.nvim",

    cmd = "ToggleTerm",

    keys = {
      { "<c-t>", "<CMD>ToggleTerm<CR>", desc = "Toggle terminal" },
    },

    after = function ()
      require("toggleterm").setup({
        size = 25,
        autochdir = true,
      })
    end,
  }
}
