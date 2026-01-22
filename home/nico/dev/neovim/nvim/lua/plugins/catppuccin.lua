return {
  "catppuccin-nvim",
  dir = vim.fn.stdpath("data") .. "/site/pack/hm/start/catppuccin-nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- load the colorscheme here
    require("catppuccin").setup({
      transparent_background = true,
      mini = { indentscope_color = "comment", },
      custom_highlights = function(colors)
        return {
          Pmenu = { bg = "#1E1E2E" },
        }
      end
    })
    vim.cmd.colorscheme "catppuccin"
  end,
}
