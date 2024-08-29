return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",

    lazy = false,

    config = function(_, opts)
      require("ibl").setup(opts)
    end,

    opts = {
      scope = {
        enabled = false,
        show_start = false,
        show_end = false,
        show_exact_scope = false,
      },
    },
  }
}
