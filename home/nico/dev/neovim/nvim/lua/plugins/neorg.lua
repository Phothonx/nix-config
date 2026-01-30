return {
  "nvim-neorg/neorg",
  ft = { "norg" },
  cmd = { "Neorg" },
  -- dependencies = {
  --   { "nvim-lua/plenary.nvim" },
  --   { "nvim-treesitter/nvim-treesitter" },
  -- },
  lazy = false,
  opts = {
    load = {
      ["core.defaults"] = {},
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
