vim.g.vimwiki_list = {
  {
    path = vim.fn.expand("~/Documents/wiki"),
    syntax = "markdown",
    ext = ".md",
  },
}
-- only files inside the wiki are vimwiki; other .md stay plain markdown
vim.g.vimwiki_global_ext = 0
