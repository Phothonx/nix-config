return {
  "nvim-neorg/neorg",
  ft = { "norg" },
  cmd = { "Neorg" },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
    { "3rd/image.nvim" }
  },
  lazy = true;
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {
        icon_preset = "diamond",
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
