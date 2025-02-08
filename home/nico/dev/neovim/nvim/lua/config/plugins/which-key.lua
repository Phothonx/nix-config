require("which-key").setup({
  delay = 100,
})

vim.keymap.set("n","<leader>?", function() require("which-key").show({ global = true }) end, { desc = "Buffer Local Keymaps (which-key)"})
