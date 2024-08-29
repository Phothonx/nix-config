require("catppuccin").setup({
  flavour = "mocha",
  show_end_of_buffer = true,
  term_colors = true,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" }, -- Change the style of comments
    conditionals = { "italic" },
    loops = { "bold" },
    functions = { "bold" },
  },
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
    leap = true,
    telescope = {
      enabled = true,
      style = "nvchad",
    },
    neotree = true;
    nvim_surround = false,
    cmp = true,
    which_key = true,
    indent_blankline = {
     enabled = true,
     scope_color = "mauve", -- catppuccin color (eg. `lavender`) Default: text
     colored_indent_levels = true,
   },
  },
})
