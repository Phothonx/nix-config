require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.move").setup()
require("mini.statusline").setup()
require('mini.trailspace').setup()
require("mini.align").setup()
require("mini.ai").setup()        -- richer a/i text objects (af, ia, if, ...)
require("mini.bracketed").setup() -- ]b [b ]q [q ]u [u ... bracket navigation
require("mini.splitjoin").setup() -- gS to split/join argument lists

-- surround on the gz prefix so it doesn't fight flash for bare `s`
require("mini.surround").setup({
  mappings = {
    add = "gza",
    delete = "gzd",
    replace = "gzr",
    find = "gzf",
    find_left = "gzF",
    highlight = "gzh",
    update_n_lines = "gzn",
  },
})

require("mini.files").setup({
  options = {
    use_as_default_explorer = true,
  },
  windows = {
    width_preview = 50,
  },
  mappings = {
    go_in = "L",
    go_in_plus = "l",
  },
})

require("mini.indentscope").setup({
  draw = {
    delay = 50,
    animation = require("mini.indentscope").gen_animation.none(),
  },
  options = {
    try_as_border = true,
  },
})

require("mini.diff").setup({
  view = {
    style = "sign",
    signs = {
      add = "▍",
      change = "▍",
      delete = "▍",
    },
  },
  delay = {
    text_change = 100,
  },
})

vim.keymap.set("n", "<leader>e", function()
  MiniFiles.open(MiniFiles.get_latest_path())
end, { desc = "Open last Files instance" })

vim.keymap.set("n", "<leader>E", function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
end, { desc = "Open Files from buffer dir" })

vim.keymap.set("n", "<leader>t", function()
  MiniTrailspace.trim()
end, { desc = "Grass cutter" })
