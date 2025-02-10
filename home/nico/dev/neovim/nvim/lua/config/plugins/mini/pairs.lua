require("mini.pairs").setup()

local toggle_global_pairing = function()
  vim.g.minipairs_disable = not vim.g.minipairs_disable
end

vim.keymap.set('n', '<leader>up', toggle_global_pairing, { desc = "Toggle pairing globally"; })
