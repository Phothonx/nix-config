require("mini.diff").setup({
  view = {
    style = "sign",
    signs = { add = '▋', change = '▋', delete = '▋' },
  },
  delay = {
    text_change = 100,
  },
})
