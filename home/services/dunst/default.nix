{ pkgs, config, theme, colors, ... }:
{
  services.dunst = {
    enable = true;
    iconTheme = theme.icons;
    settings = with colors; {
      global = {
        width = 500;
        notification_limit = 0;
        origin = "top-right";
        offset = "15x15";
        progress_bar_height = 8;
        progress_bar_frame_width = 0;
        progress_bar_corner_radius = 5;
        padding = 15;
        horizontal_padding = 15;
        text_icon_padding = 15;
        frame_width = 2;
        gap_size = 8;
        separator_color = "frame";
        font = theme.fonts.sansSerif;
        vertical_alignment = "center";
        corner_radius = 15;
        mouse_left_click = "do_action";
        mouse_middle_click = "close_all";
        mouse_right_click = "close_current";
        layer = "overlay";
      };
      fullscreen_delay_everything = {fullscreen = "delay";};
      urgency_critical = {
        background = "#${base10}";
        foreground = "#${base07}";
        frame_color = "#${base08}";
        highlight = "#${base08}";
        fullscreen = "show";
      };
      urgency_low = {
        background = "#${base10}";
        foreground = "#${base07}";
        frame_color = "#${base0A}";
        highlight = "#${base0A}";
        fullscreen = "show";
      };
      urgency_normal = {
        background = "#${base10}";
        foreground = "#${base07}";
        frame_color = "#${base0E}";
        highlight = "#${base0E}";
        fullscreen = "show";
      };
    };
  };
}
