{ pkgs, ... }:
{
  programs.wezterm = {
    enable = true;

     extraConfig = ''
      local wezterm = require "wezterm"

      local config = {}

      if wezterm.config_builder then
        config = wezterm.config_builder()
      end

      config = {
        check_for_updates = false,

        font = wezterm.font 'JetBrainsMono Nerd Font',
        font_size = 10,

        color_scheme = 'Catppuccin Macchiato',

        hide_tab_bar_if_only_one_tab = true,
        enable_scroll_bar = true,
        scrollback_lines = 10000,

        window_padding = {
          left = 3,
          right = 3,
          top = 3,
          bottom = 3,
        },

      }

      return config
    '';
  };
}