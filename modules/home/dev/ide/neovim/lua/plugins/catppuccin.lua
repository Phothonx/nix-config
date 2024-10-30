return {
  "catppuccin/nvim",

  name = "catppuccin",

  lazy = false,

  priority = 1000,

  opts = {
    flavour = "mocha",
    show_end_of_buffer = true,
    term_colors = true,
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { "italic" }, -- Change the style of comments
      conditionals = { "italic" },
      loops = { "bold" },
      functions = { "bold" },
    },

    intergrations = {

      indent_blankline = {
        enabled = true,
      },

      leap = true,

      treesitter = true,

      neotree = true,

      cmp = true,

      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
          ok = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
          ok = { "underline" },
        },
        inlay_hints = {
            background = true,
        },
      },

      telescope = {
        enabled = true,
        style = "nvchad"
      }
    },
  },

  config = function(_, opts)
    require("catppuccin").setup(opts)
    -- setup must be called before loading
    vim.cmd.colorscheme "catppuccin"
  end
}
