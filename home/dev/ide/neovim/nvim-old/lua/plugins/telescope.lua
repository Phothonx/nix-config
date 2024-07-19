return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },

    cmd = "Telescope",
    keys = {
      { "<leader>ff", mode = "n", "<cmd>Telescope find_files<cr>" },
      { "<leader>fg", mode = "n", "<cmd>Telescope live_grep<cr>" },
      { "<leader>fb", mode = "n", "<cmd>Telescope buffers<cr>" },
      { "<leader>fh", mode = "n", "<cmd>Telescope help_tags<cr>" },
    },

    config = function (_, opts)
      require("telescope").setup(opts)
    end,

    opts = {}
  }
}
