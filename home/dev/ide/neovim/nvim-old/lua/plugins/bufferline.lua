return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",

    event = "VeryLazy",

    config = function (_, opts)
      vim.opt.termguicolors = true
      require("bufferline").setup(opts)
    end,

    opts = {
      options = {
        numbers = "buffer_id",
        indicator = { style = "none", },
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = true,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = false,
          }
        },
        show_buffer_close_icons = false,
        separator_style = {"", ""},
        show_close_icon = false,
        always_show_bufferline = false,
      }
    }
  }
}
