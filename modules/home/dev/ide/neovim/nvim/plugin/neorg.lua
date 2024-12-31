require("neorg").setup({
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
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = "*.norg",
	callback = function()
		vim.opt.conceallevel = 3
	end,
})
