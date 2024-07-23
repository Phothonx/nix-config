return {
  {
    "indent-blankline.nvim",

    event = "BufReadPre";

    after = function()
      require("ibl").setup({
        scope = {
          enabled = false,
          show_start = false,
          show_end = false,
          show_exact_scope = false,
        },
      })
    end,
  }
}
