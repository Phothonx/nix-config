return {
  "nvim-neorg/neorg",
  event = "VeryLazy",
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {},
      ["core.export"] = {},
      ["core.export.markdown"] = {},
      ["core.dirman"] = {
        config = {
          workspaces = {
            notes = "~/Documents/notes",
            bookmarks = "Documents/bookmarks"
          },
          default_workspace = "notes",
        },
      },
    },
  },
}
