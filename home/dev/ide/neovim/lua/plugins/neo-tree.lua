return {
  {
    "neo-tree.nvim",
    keys = {
      { "<leader>e", "<CMD>Neotree focus<CR>", desc = "NeoTree focus" },
    },

    after = function()
      require("neo-tree").setup()
    end,
  }
}
