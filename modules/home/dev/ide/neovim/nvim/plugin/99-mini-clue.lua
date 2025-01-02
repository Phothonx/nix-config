require("mini.clue").setup({
  delay = 200,

  triggers = {
    -- Leader triggers
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- Marks
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },

    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    require("mini.clue").gen_clues.builtin_completion(),
    require("mini.clue").gen_clues.g(),
    require("mini.clue").gen_clues.marks(),
    require("mini.clue").gen_clues.registers(),
    require("mini.clue").gen_clues.windows(),
    require("mini.clue").gen_clues.z(),
  },
})

local toggle_buffer_clue = function()
  vim.b.miniclue_disable = not vim.b.mininclue_disable
end

local toggle_global_clue = function()
  vim.g.miniclue_disable = not vim.g.miniclue_disable
end

vim.keymap.set('n', '<leader>cg', toggle_global_clue, { desc = "Toggle clue globally"; })
vim.keymap.set('n', '<leader>cb', toggle_buffer_clue, { desc = "Toggle clue for a buffer"; })

-- au FileType special_ft lua MiniClue.ensure_buf_triggers()

