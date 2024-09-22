return {
  {
    "render-markdown",

    ft = "md",

    cmd = "RenderMarkdown",

    after = function ()
      require("render-markdown").setup({
        render_modes = { 'n', 'v', 'i', 'c' }
      })
    end,
  }
}
