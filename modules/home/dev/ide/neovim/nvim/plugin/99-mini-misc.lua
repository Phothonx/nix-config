require('mini.misc').setup()

vim.keymap.set('n', '<leader>o', "<CMD>lua MiniMisc.zoom()<CR>", { desc = "Zoom into buffer"; })
