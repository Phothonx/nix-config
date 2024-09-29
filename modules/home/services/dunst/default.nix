{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.services.dunst;
  inherit (config) theme;
in {
  config = mkIf cfg.enable {
    services.dunst = {
      iconTheme = theme.icons;
      settings = with theme.palette; {
        global = {
          width = 400;
          height = 400;
          notification_limit = 0;
          origin = "top-center";
          offset = "0x10";
          follow = "mouse";
          progress_bar_height = 8;
          idle_threshold = 120;
          markup = "full";
          progress_bar_frame_width = 0;
          progress_bar_corner_radius = 5;
          padding = 15;
          horizontal_padding = 15;
          text_icon_padding = 15;
          frame_width = 2;
          gap_size = 0;
          separator_color = "frame";
          font = theme.fonts.normal.name;
          vertical_alignment = "center";
          corner_radius = 15;
          mouse_left_click = "do_action";
          mouse_middle_click = "close_all";
          mouse_right_click = "close_current";
          layer = "overlay";
          foreground = "#${base07}";
          background = "#${base10}";
        };
        fullscreen_delay_everything = {fullscreen = "delay";};
        urgency_critical = {
          frame_color = "#${base08}";
          highlight = "#${base08}";
          fullscreen = "show";
        };
        urgency_low = {
          frame_color = "#${base00}";
          highlight = "#${base0E}";
          fullscreen = "show";
        };
        urgency_normal = {
          frame_color = "#${base0E}";
          highlight = "#${base0E}";
          fullscreen = "show";
        };
      };
    };
  };
}
