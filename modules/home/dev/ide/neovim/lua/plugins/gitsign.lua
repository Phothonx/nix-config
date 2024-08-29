return {
  {
    "gitsigns.nvim",

    event = { "BufReadPost", "BufNewFile" },

    after = function ()
      require("gitsigns").setup({
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "󰍵" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "│" },
        }
      })
    end,
  }
}
