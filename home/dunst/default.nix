{ pkgs, config, ... }:
{
  services.dunst = {
    enable = true;
    inherit (config.gtk) iconTheme;
    settings = {
      global = {
        follow = "mouse";
        width = 500;
        notification_limit = 0;
        origin = "top-right";
        offset = "15x15";
        progress_bar_height = 8;
        padding = 15;
        horizontal_padding = 15;
        text_icon_padding = 15;
        frame_width = 2;
        gap_size = 8;
        separator_color = "frame";
        font = "Ubuntu Nerd Font";
        # format
        vertical_alignment = "center";
        corner_radius = 8;
        mouse_left_click = "do_action";
        mouse_middle_click = "close_all";
        mouse_right_click = "close_current";
      };
      # fullscreen_delay_everything = {fullscreen = "delay";};
      # urgency_critical = {
      #   background = c.error_container;
      #   foreground = c.on_error_container;
      #   frame_color = c.error;
      # };
      # urgency_low = {
      #   background = c.secondary_container;
      #   foreground = c.on_secondary_container;
      #   frame_color = c.secondary;
      # };
      # urgency_normal = {
      #   background = c.primary_container;
      #   foreground = c.on_primary_container;
      #   frame_color = c.primary;
      # };
    };
  };
}