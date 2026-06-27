require("blink.cmp").setup({
  enabled = function()
    return not vim.tbl_contains({ "markdown", "norg", "txt" }, vim.bo.filetype)
  end,
  keymap = {
    preset = "default",
  },
  completion = {
    keyword = { range = "full" },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 400,
    },
    list = {
      selection = {
        preselect = false,
        auto_insert = true,
      },
    },
    ghost_text = {
      enabled = true,
      show_without_menu = false,
    },
    trigger = {
      show_on_backspace = true,
      show_on_backspace_in_keyword = true,
    },
  },
  fuzzy = {
    sorts = { "exact", "score", "sort_text" },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    providers = {
      buffer = {
        opts = {
          get_bufnrs = vim.api.nvim_list_bufs,
        },
      },
      snippets = {
        opts = {
          friendly_snippets = true,
          ignored_filetypes = { "tex", "plaintex", "bib" },
        },
      },
    },
  },
  cmdline = {
    keymap = {
      preset = "default",
    },
    completion = {
      list = {
        selection = {
          preselect = false,
        },
      },
      menu = {
        auto_show = true,
      },
    },
  },
})
