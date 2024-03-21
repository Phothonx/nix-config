return {
   {
    'akinsho/toggleterm.nvim',
    version = "*", 

    config = function (_, opts)
      require("toggleterm").setup(opts)
    end,

    opts = {}
  }
}
