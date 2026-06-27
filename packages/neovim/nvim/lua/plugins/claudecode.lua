-- snacks provides the terminal split; it is auto-detected
require("claudecode").setup()

local map = vim.keymap.set

map("n", "<leader>cc", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude Code" })
map("n", "<leader>cf", "<cmd>ClaudeCodeFocus<cr>", { desc = "Focus Claude" })
map("n", "<leader>cr", "<cmd>ClaudeCode --resume<cr>", { desc = "Resume Claude" })
map("n", "<leader>cC", "<cmd>ClaudeCode --continue<cr>", { desc = "Continue Claude" })
map("n", "<leader>cm", "<cmd>ClaudeCodeSelectModel<cr>", { desc = "Select Claude model" })
map("n", "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Add current buffer to Claude" })
map("v", "<leader>cs", "<cmd>ClaudeCodeSend<cr>", { desc = "Send selection to Claude" })
map("n", "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Accept Claude diff" })
map("n", "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Deny Claude diff" })

-- send the file under the cursor from the mini.files explorer
vim.api.nvim_create_autocmd("FileType", {
  pattern = "minifiles",
  callback = function(ev)
    map("n", "<leader>cs", "<cmd>ClaudeCodeTreeAdd<cr>", { buffer = ev.buf, desc = "Add file to Claude" })
  end,
})
