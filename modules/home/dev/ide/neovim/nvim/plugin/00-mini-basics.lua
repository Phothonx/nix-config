require("mini.basics").setup({
    -- Options. Set to `false` to disable.
    options = {
      -- Basic options ('number', 'ignorecase', and many more)
      basic = true,
      -- Extra UI features ('winblend', 'cmdheight=0', ...)
      extra_ui = false,
      -- Presets for window borders ('single', 'double', ...)
      win_borders = 'single',
    },

    -- Mappings. Set to `false` to disable.
    mappings = {
      -- Basic mappings (better 'jk', save with Ctrl+S, ...)
      basic = true,
      -- Prefix for mappings that toggle common options ('wrap', 'spell', ...).
      -- Supply empty string to not create these mappings.
      option_toggle_prefix = [[\]],
      -- Window navigation with <C-hjkl>, resize with <C-arrow>
      windows = true,
      -- Move cursor in Insert, Command, and Terminal mode with <M-hjkl>
      move_with_alt = true,
    },

    -- Auto. Set to `false` to disable
    autocommands = {
      -- Basic autocommands (highlight on yank, start Insert in terminal, ...)
      basic = true,
      -- Set 'relativenumber' only in linewise and blockwise Visual mode
      relnum_in_visual_mode = true,
    },

    -- Whether to disable showing non-error feedback
    silent = false,
})

-- indenting
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2

vim.o.numberwidth = 1

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.clipboard = "unnamedplus"
