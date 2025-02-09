require("which-key").setup({
  delay = 200,
})

vim.keymap.set("n","<leader>?", function() require("which-key").show({ global = true }) end, { desc = "Buffer Local Keymaps (which-key)"})
