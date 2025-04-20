return {
  "nvim-treesitter/nvim-treesitter",

  config = function (_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,

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
