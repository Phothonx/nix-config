local km = vim.keymap.set

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- Normal --
-- Better window navigation
km("n", "<leader>h", "<C-w>h", { desc = "Move to left window"})
km("n", "<leader>j", "<C-w>j", { desc = "Move to down window"})
km("n", "<leader>k", "<C-w>k", { desc = "Move to Upper window"})
km("n", "<leader>l", "<C-w>l", { desc = "Move to right window"})
