local parser_install_dir = vim.fn.stdpath("cache") .. "/treesitters"
vim.fn.mkdir(parser_install_dir, "p")
vim.opt.runtimepath:append(parser_install_dir)

return {
  {
  "nvim-treesitter/nvim-treesitter",

  event = "VeryLazy",

  opts = {
    auto_install = false,
    ensure_installed = {},
    parser_install_dir = parser_install_dir,
    },
  },
}
