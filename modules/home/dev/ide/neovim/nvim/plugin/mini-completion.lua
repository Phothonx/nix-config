require("mini.completion").setup()

local imap_expr = function(lhs, rhs)
  vim.keymap.set('i', lhs, rhs, { expr = true })
end
imap_expr('<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])


local toggle_buffer_completion = function()
  vim.b.minicompletion_disable = not vim.b.minicompletion_disable
end

local toggle_global_completion = function()
  vim.g.minicompletion_disable = not vim.g.minicompletion_disable
end

vim.keymap.set('n', '<leader>cg', toggle_global_completion, { desc = "Toggle completion globally"; })
vim.keymap.set('n', '<leader>cb', toggle_buffer_completion, { desc = "Toggle completion for a buffer"; })
