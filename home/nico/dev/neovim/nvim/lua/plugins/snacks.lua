return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    explorer = {
      enabled = true,
      replace_netrw = true,
    },
    statuscolumn = { enabled = false, },
    terminal = { enabled = true, },
    toggle = { enabled = true, },
    picker = { enabled = true, },
    scratch = { enabled = true, },
  },
}
