{ colors, ... }:
{
  programs.kitty = {
    enable = true;

    shellIntegration = {
      enableZshIntegration = true;
      mode = "";
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 13;
    };

    theme = "Catppuccin-Mocha";

    keybindings = import ./binds.nix;

    settings = {
      linux_display_server = "wayland";
      wayland_titlebar_color = "background";

      # General
      background_opacity = "0.6";
      clear_all_shortcuts = "yes";
      scrollback_lines = 10000;
      allow_remote_control = true;
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      window_padding_width = 20;

      # Colorscheme
      foreground = "#${colors.base05}";
      background = "#${colors.base00}";
      selection_background = "#${colors.base05}";
      selection_foreground = "#${colors.base00}";
      url_color = "#${colors.base0D}";
      cursor = "#${colors.base05}";
      color0 = "#${colors.base00}";
      color1 = "#${colors.base08}";
      color2 = "#${colors.base0B}";
      color3 = "#${colors.base0A}";
      color4 = "#${colors.base0D}";
      color5 = "#${colors.base0E}";
      color6 = "#${colors.base0C}";
      color7 = "#${colors.base05}";
      color8 = "#${colors.base03}";
      color9 = "#${colors.base08}";
      color10 = "#${colors.base0B}";
      color11 = "#${colors.base0A}";
      color12 = "#${colors.base0D}";
      color13 = "#${colors.base0E}";
      color14 = "#${colors.base0C}";
      color15 = "#${colors.base07}";
      color16 = "#${colors.base09}";
      color17 = "#${colors.base0F}";
      color18 = "#${colors.base01}";
      color19 = "#${colors.base02}";
      color20 = "#${colors.base04}";
      color21 = "#${colors.base06}";
    };
  };    
}