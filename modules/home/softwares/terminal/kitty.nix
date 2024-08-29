{ colors, artwork, pkgs, config, ...}:
{
  programs.kitty = {
    enable = true;
    settings = with colors; {
      # FONTS 
      font_family = artwork.fonts.mono.name;
      font_size = "15";

      # CURSOR
      cursor = "#${base13}";
      cursor_text_color = "#${base11}";
      cursor_shape = "beam";
      cursor_beam_thickness = "2";
      
      # SCROLLBACK
      scrollback_lines = "10000";

      # MOUSE
      mouse_hide_wait = "0";
      copy_on_select = "yes";
      
      # TERM BELL
      enable_audio_bell = "no";
      
      # WINDOW LAYOUT
      window_padding_width = "20";
      placement_strategy = "center";
      hide_window_decorations = "no";
      confirm_os_window_close = "0";
      
      # TAB BAR
      
      # COLOR SHEME
      foreground = "#${base07}";
      background = "#${base00}";
      
      background_opacity = "1.0";

      selection_foreground = "none";
      selection_background = "#${base03}";
      
      color0 = "#${base02}";
      color8 =  "#${base03}";

      color1 = "#${base08}";
      color9 = "#${base12}";
      
      color2 = "#${base0B}";
      color10 = "#${base14}";
      
      color3  = "#${base0A}";
      color11 = "#${base13}";
      
      color4 = "#${base0D}";
      color12 = "#${base16}";
      
      color5 = "#${base0E}";
      color13 = "#${base17}";
      
      color6 = "#${base0C}";
      color14 = "#${base15}";
      
      color7 = "#${base05}";
      color15 = "#${base06}";
      
      mark1_foreground = "#${base17}";
      mark1_background = "#${base11}";
      
      mark2_foreground = "#${base0E}";
      mark2_background = "#${base11}";
      
      mark3_foreground = "#${base16}";
      mark3_background = "#${base11}";

      # ADVANCED
      allow_remote_control = "yes";
      
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
