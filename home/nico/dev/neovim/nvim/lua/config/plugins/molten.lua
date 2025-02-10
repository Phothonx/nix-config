local g = vim.g

g.molten_open_cmd = "firefox"
g.molten_auto_open_output = false
g.molten_image_provider = "image.nvim"
g.molten_output_win_border = { "", "━", "", "" }
g.molten_output_show_more = true
-- g.molten_virt_text_output = true

vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>", { desc = "Initialize the plugin" })
vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>", { desc = "Run operator selection" })
vim.keymap.set("n", "<localleader>rl", ":MoltenEvaluateLine<CR>", { desc = "Evaluate line" })
vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", { desc = "Re-evaluate cell" })
vim.keymap.set("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "Evaluate visual selection" })
vim.keymap.set("n", "<localleader>rd", ":MoltenDelete<CR>", { desc = "molten delete cell" })
vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>", { desc = "hide output" })
vim.keymap.set("n", "<localleader>os", ":noautocmd MoltenEnterOutput<CR>",{ desc = "show/enter output" })
vim.keymap.set("n", "<localleader>ob", ":MoltenOpenInBrowser<CR>", { desc = "Open in browser" })
