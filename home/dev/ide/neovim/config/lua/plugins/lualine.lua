return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    
    lazy = false, 

    init = function(_, opts)
      require("lualine").setup(opts)
    end,

    opts = {
      options = {
        theme = "catppuccin",
      },
    }
  }
}
