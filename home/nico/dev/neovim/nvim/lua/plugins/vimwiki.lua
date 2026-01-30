
return {
  "vimwiki/vimwiki",
  ft = { "markdown" },
  keys = {
    { "<leader>ww", mode = {"n"}, desc = "Open default wiki index file" },
    { "<leader>wt", mode = {"n"}, desc = "Open default wiki index file in a new tab" },
    { "<leader>wha", mode = {"n"}, "<CMD>VimwikiAll2HTML<CR>", desc = "Convert all your wiki pages to HTML" },
    { "<leader>wha", mode = {"n"}, "<CMD>Vimwiki2HTML<CR>", desc = "Convert current wiki page to HTML" },
  },
  lazy = true,
  init = function()
    vim.g.vimwiki_list = {
      {
        path = "~/vimwiki/",
        path_html = "~/vimwiki/site_html/",
        syntax = "markdown",
        ext = "md",
        global_ext = 0,
        custom_wiki2html = "mark2html",
      },
    }
  end,
}
