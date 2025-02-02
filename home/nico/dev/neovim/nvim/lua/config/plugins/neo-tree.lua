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

vim.keymap.set("n", "<leader>f", "<CMD>Neotree focus<CR>", { desc = "Toggle dotfiles"; })
