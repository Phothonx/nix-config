require("mini.diff").setup({
  view = {
    style = "sign",
    signs = { add = '▍', change = '▍', delete = '▍', },
  },
  delay = {
    text_change = 100,
  },
})

-- disable by default (toggle shortcut with snacks <leader>uf)
vim.g.minidiff_disable = true
