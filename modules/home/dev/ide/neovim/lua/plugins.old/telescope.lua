return {
  {
    "nvim-telescope/telescope.nvim",

    cmd = "Telescope",

    keys = {
      { "<leader>ff", mode = "n", "<cmd>Telescope find_files<cr>" },
      { "<leader>fg", mode = "n", "<cmd>Telescope live_grep<cr>" },
      { "<leader>fb", mode = "n", "<cmd>Telescope buffers<cr>" },
      { "<leader>fh", mode = "n", "<cmd>Telescope help_tags<cr>" },
    },

  },
}
