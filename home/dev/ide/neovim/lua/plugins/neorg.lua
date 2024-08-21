return {
  {
    "neorg",

    ft = "neorg",

    cmd = "Neorg",

    after = function ()
      vim.opt.conceallevel = 3

      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.completion"] = {},
          ["core.export"] = {},
          ["core.export.markdown"] = {},
          ["core.latex.renderer"] = {},
          ["core.presenter"] = {},
          ["core.summary"] = {},
        },
      })
    end,
  }
}
