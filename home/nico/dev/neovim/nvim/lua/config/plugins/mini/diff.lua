require("mini.diff").setup({
  view = {
    style = "sign",
    signs = { add = '▍', change = '▍', delete = '▍', },
  },
  delay = {
    text_change = 100,
  },
})

local toggle_minidiff = function()
  vim.g.minidiff_disable = not vim.g.minidiff_disable
end

vim.keymap.set('n', '<leader>uf', toggle_minidiff, { desc = "Toggle mini diff"; })
