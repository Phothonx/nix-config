{config, ...}: let
  inherit (config) colorScheme fontsProfiles;
in {
  programs.kitty = {
    enable = true;
    shellIntegration = {
      enableBashIntegration = true;
      enableFishIntegration = true;
      # mode = "no-cursor";
    };

    settings = with colorScheme.palette; {
      # FONTS
      "font_family family" = fontsProfiles.monospace.name;
      font_size = "12";

      # CURSOR
      cursor = "none"; # reverse colors
      cursor_shape = "beam";
      cursor_beam_thickness = "2";
      cursor_shape_unfocused =  "unchanged";

      # cursor_trail = 1;

      scrollback_pager_history_size = 10;

      # SCROLLBACK
      scrollback_lines = "10000";

      # MOUSE
      mouse_hide_wait = "0";
      copy_on_select = "yes";

      # TERM BELL
      enable_audio_bell = "no";

      # WINDOW LAYOUT
      remember_window_size = "no";
      window_padding_width = "10";
      hide_window_decorations = "yes";
      confirm_os_window_close = "0";

      # TAB BAR

      # COLOR SHEME
      foreground = "#${foreground}";
      background = "#${background}";

      # background_opacity = "0.3";

      selection_foreground = "none";
      selection_background = "none";

      color0 = "#${black}";
      color8 = "#${grey}";

      color1 = "#${red}";
      color9 = "#${b_red}";

      color2 = "#${green}";
      color10 = "#${b_green}";

      color3 = "#${yellow}";
      color11 = "#${b_yellow}";

      color4 = "#${blue}";
      color12 = "#${b_blue}";

      color5 = "#${purple}";
      color13 = "#${b_purple}";

      color6 = "#${cyan}";
      color14 = "#${b_cyan}";

      color7 = "#${white}";
      color15 = "#${b_white}";

      notify_on_finish = "unfocused 10";
      # KEYBOARD
      # clear_all_shortcuts = "yes";
    };

    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+shift+c" = "copy_to_clipboard";

      "ctrl+plus" = "increase_font_size";
      "ctrl+minus" = "decrease_font_size";
      "ctrl+equal" = "restore_font_size";
    };
  };
}
