return {
  {
    "indent-blankline.nvim",

    event = { "BufReadPost", "BufNewFile" },

    after = function()
      require("ibl").setup({
        scope = {
          show_start = false,
          show_end = false,
          show_exact_scope = false,
        },
      })
    end,
  }
}
