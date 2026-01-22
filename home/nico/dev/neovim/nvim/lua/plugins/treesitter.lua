return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  opts = {
    auto_install = false,
    -- ensure_installed = {},
    disable = {},
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true, },
  },
}
