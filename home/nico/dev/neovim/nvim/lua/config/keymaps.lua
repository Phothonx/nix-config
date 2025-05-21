local map = vim.keymap.set

-- disable some
map("n", "q:", "") -- "all my homies hate q:" -Confucius

map("n", "<leader>h", "<Cmd>noh<CR>", {desc = "Clear search Highlight"})

-- Window navigation
map('n', '<C-H>', '<C-w>h', { desc = 'Focus on left window' })
map('n', '<C-J>', '<C-w>j', { desc = 'Focus on below window' })
map('n', '<C-K>', '<C-w>k', { desc = 'Focus on above window' })
map('n', '<C-L>', '<C-w>l', { desc = 'Focus on right window' })

-- Reselect latest changed, put, or yanked text
map('n', 'gV', '"`[" . strpart(getregtype(), 0, 1) . "`]"', { expr = true, replace_keycodes = false, desc = 'Visually select changed text' })

-- Window resize (respecting `v:count`)
map('n', '<C-Left>',  '"<Cmd>vertical resize -" . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = 'Decrease window width' })
map('n', '<C-Down>',  '"<Cmd>resize -"          . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = 'Decrease window height' })
map('n', '<C-Up>',    '"<Cmd>resize +"          . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = 'Increase window height' })
map('n', '<C-Right>', '"<Cmd>vertical resize +" . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = 'Increase window width' })

-- Move only sideways in command mode. Using `silent = false` makes movements
-- to be immediately shown.
map('c', '<M-h>', '<Left>',  { silent = false, desc = 'Left' })
map('c', '<M-l>', '<Right>', { silent = false, desc = 'Right' })
map('c', '<M-j>', '<Down>',  { silent = false, desc = 'Down' })
map('c', '<M-k>', '<Up>',    { silent = false, desc = 'Up' })

-- Don't `noremap` in insert mode to have these keybindings behave exactly
map('i', '<M-h>', '<Left>',  { noremap = false, desc = 'Left' })
map('i', '<M-j>', '<Down>',  { noremap = false, desc = 'Down' })
map('i', '<M-k>', '<Up>',    { noremap = false, desc = 'Up' })
map('i', '<M-l>', '<Right>', { noremap = false, desc = 'Right' })

map('t', '<M-h>', '<Left>',  { desc = 'Left' })
map('t', '<M-j>', '<Down>',  { desc = 'Down' })
map('t', '<M-k>', '<Up>',    { desc = 'Up' })
map('t', '<M-l>', '<Right>', { desc = 'Right' })
