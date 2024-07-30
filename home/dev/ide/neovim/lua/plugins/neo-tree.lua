return {
  {
    "neo-tree.nvim",

    keys = {
      { "<leader>e", "<CMD>Neotree focus<CR>", desc = "NeoTree Focus" },
      { "<leader>g", "<CMD>Neotree float git_status<CR>", desc = "Neotree Git status (float)"},
      { "<leader>b", "<CMD>Neotree float focus buffer<CR>", desc = "Neotree Buffers (float)"},
    },

    after = function ()
      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        sort_case_insensitive = false,
        source_selector = {
          winbar = true,
        },
        default_component_configs = {
          name = {
              trailing_slash = true,
              highlight_opened_files = "all",
          },
        },
        symlink_target = {
          enabled = true,
        },
      })
    end,
  }
}
