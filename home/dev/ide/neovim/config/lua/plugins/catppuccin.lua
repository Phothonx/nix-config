return {
  {
    "catppuccin/nvim",
    name = "catppuccin",

    priority = 1000,
    lazy = false,

    init = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme "catppuccin"
    end,

    opts = {
      flavour = "mocha",
      show_end_of_buffer = true,
      term_colors = true,
      intergrations = {
        native_lsp = {
          enabled = true,
          virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
          },
          underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
          },
          inlay_hints = {
              background = true,
          },
        },
        treesitter = true,
        gitsigns = true,
        notify = true,
        leap = true,
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        nvimtree = true,
        cmp = true,
        which_key = true,
        mason = true,
        indent_blankline = {
         enabled = true,
         scope_color = "mauve", -- catppuccin color (eg. `lavender`) Default: text
         colored_indent_levels = true,
       },
      },
    }
  }
}
