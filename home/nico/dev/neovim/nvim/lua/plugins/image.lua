return {
  "3rd/image.nvim",
  ft = { "markdown", "norg" },
  lazy = true,
  build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
  opts = {
    processor = "magick_cli",
    backend = "kitty", -- Kitty will provide the best experience, but you need a compatible terminal
    integrations = {}, -- do whatever you want with image.nvim's integrations
    max_height_window_percentage = math.huge, -- this is necessary for a good experience
    max_width_window_percentage = math.huge,
    window_overlap_clear_enabled = true,
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
    neorg = { enabled = false, },
    markdown = { enabled = false, },
  },
}
