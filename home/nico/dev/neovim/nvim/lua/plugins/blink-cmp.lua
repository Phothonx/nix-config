return {
  "saghen/blink.cmp",
  deps = { "echasnovski/mini.nvim", "rafamadriz/friendly-snippets" },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    enabled = function() return not vim.tbl_contains({ "markdown", "norg", "txt" }, vim.bo.filetype) end,


    keymap = { preset = 'default' },

    completion = {
      keyword = { range = 'full' },
      documentation = { auto_show = true, auto_show_delay_ms = 350 },
      list = { selection = { preselect = false, auto_insert = true } },
      ghost_text = { enabled = true },
    },

    cmdline = {
      keymap = { preset = "default", },
      completion = {
        list = { selection = { preselect = false, } },
        menu = { auto_show = true, },
      },
    },
  }
}
