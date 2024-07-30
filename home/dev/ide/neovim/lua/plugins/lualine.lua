return {
  {
    "lualine.nvim",

    event = "UIEnter",

    after = function ()
      require('lualine').setup({
        theme = "catppuccin",
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
      })
    end,
  }
}
