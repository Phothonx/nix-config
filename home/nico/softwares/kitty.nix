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

      open_url_with = "firefox";
      underline_hyperlinks = "always";

      # TRADE PERF - MEMORY
      input_delay  = 8;
      repaint_delay  = 2;
      sync_to_monitor  = false;
      wayland_enable_ime = false;

      # CURSOR
      cursor = "#${foreground}"; # reverse colors
      cursor_text_color = "#${background}";
      cursor_shape = "beam";
      cursor_beam_thickness = "1.8";
      cursor_shape_unfocused =  "unchanged";

      # cursor_trail = 1;

      scrollback_pager_history_size = 10;

      # SCROLLBACK
      scrollback_lines = "5000";
      touch_scroll_multiplier = 3.0;

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

      selection_foreground = "none";
      selection_background = "#${d_grey}";

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

      notify_on_cmd_finish = "unfocused 10";
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
