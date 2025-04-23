return {
  "nvim-neorg/neorg",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  lazy = false;
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {
        icon_preset = "varied",
      },
      ["core.dirman"] = {
        config = {
          workspaces = {
            notes = "~/Documents/notes",
          },
        },
      },
    },
  },
}
