require("options")
require("keymaps")

require("rose-pine").setup()
require("tokyonight.colors").setup()
require('catppuccin').setup({
  transparent_background = true;
})
vim.cmd.colorscheme "catppuccin"
