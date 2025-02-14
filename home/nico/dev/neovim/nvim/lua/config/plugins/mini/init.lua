require("mini.icons").setup()

require("mini.trailspace").setup()
vim.keymap.set("n", "<leader>t", function() MiniTrailspace.trim() end, {desc = "Grass cutter",})

require("mini.pick").setup()

require("mini.statusline").setup()

require("mini.indentscope").setup({
  draw = {
    delay = 50,
    animation = require('mini.indentscope').gen_animation.none(),
  },
  options = {
    try_as_border = true,
  },
})

require("mini.ai").setup()

require("mini.align").setup()

require("mini.comment").setup({
  ignore_blank_line = false,
})

require("mini.move").setup()

require("mini.splitjoin").setup()

require("mini.surround").setup({
  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    add = 'gsa', -- Add surrounding in Normal and Visual modes
    delete = 'gsd', -- Delete surrounding
    find = 'gsf', -- Find surrounding (to the right)
    find_left = 'gsF', -- Find surrounding (to the left)
    highlight = 'gsh', -- Highlight surrounding
    replace = 'gsr', -- Replace surrounding
    update_n_lines = 'gsn', -- Update `n_lines`

    suffix_last = 'l', -- Suffix to search with "prev" method
    suffix_next = 'n', -- Suffix to search with "next" method
  },
})

require("mini.cursorword")

require("config.plugins.mini.diff")
require("config.plugins.mini.files")
require("config.plugins.mini.pairs")

require('mini.misc').setup()
MiniMisc.setup_auto_root()
