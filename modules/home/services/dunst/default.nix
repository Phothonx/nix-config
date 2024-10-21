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
          follow = "mouse";

          width = "(200, 700)";
          height = "(25, 400)";

          notification_limit = 5;

          origin = "top-center";
          offset = "0x8";

          progress_bar_height = 6;
          progress_bar_frame_width = 0;
          progress_bar_corner_radius = 5;

          icon_corner_radius = 5;

          indicate_hidden = false;

          separator_height = 0;

          padding = 10;
          horizontal_padding = 10;
          text_icon_padding = 10;

          frame_width = 2;

          idle_threshold = 60;

          font = theme.fonts.normal.name;

          sticky_history = false;
          history_length = 50;

          corner_radius = 15;

          mouse_left_click = "do_action";
          mouse_middle_click = "close_all";
          mouse_right_click = "close_current";

          markup = "full";

          alignment = "center";

          fullscreen = "show";

          min_icon_size = 64;
          max_icon_size = 64;

          timeout = 4;

          frame_color = "#${base00}";
          foreground = "#${base07}";
          background = "#${base10}";
          highlight = "#${base0E}";
        };
        urgency_low = {
          highlight = "#${base0D}";
          frame_color = "#${base0D}";
        };
        urgency_normal = {
          highlight = "#${base0E}";
          frame_color = "#${base0E}";
        };
        urgency_critical = {
          highlight = "#${base08}";
          frame_color = "#${base08}";
        };
      };
    };
  };
}
