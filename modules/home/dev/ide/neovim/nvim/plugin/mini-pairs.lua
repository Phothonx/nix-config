require("mini.pairs").setup()

local toggle_buffer_pairing = function()
  vim.b.minipairs_disable = not vim.b.minipairs_disable
end

local toggle_global_pairing = function()
  vim.g.minipairs_disable = not vim.g.minipairs_disable
end

vim.keymap.set('n', '<leader>pg', toggle_global_pairing, { desc = "Toggle pairing globally"; })
vim.keymap.set('n', '<leader>pb', toggle_buffer_pairing, { desc = "Toggle pairing for a buffer"; })
