{ artwork, colors, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        disable_loading_bar = true;
        ignore_empty_input = true;
        grace = 5;
      };

      background = [
        {
          monitor = "";
          path = "screenshot";
          blur_size = 3;
          blur_passes = 3;
          noise = 0.011;
          contrast = 0.9;
          brightness = 0.83;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];

      input-field = with colors; [
        {
          monitor = "";
          size = "255, 55";
          outline_thickness = 2;
          dots_size = 0.25;
          dots_spacing = 0.42;
          dots_center = true;
          dots_rounding = -2;
          outer_color = "rgb(${base0E})";
          inner_color = "rgb(${base00})";
          font_color = "rgb(${base07})";
          check_color = "rgb(${base0A})";
          fail_color = "rgb(${base08})";
          fail_text = "<i><span foreground=\"##${base08}\">$FAIL ($ATTEMPTS)</span></i>";
          fail_transition = 300;
          fade_on_empty = true;
          fade_timeout = 3000;
          placeholder_text = "<i><span foreground=\"##${base04}\">Password...</span></i>";
          rounding = 15;
          shadow_passes = 3;
          shadow_size = 5;
          shadow_color = "rgb(${colors.base10})";
          shadow_boost = 1.3;
          position = "0, -40";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        {
          monitor = "";
          text = ''<span font_weight="bold">$TIME</span>'';
          font_family = artwork.fonts.sansSerif.name;
          font_size = 100;
          color = "rgb(${colors.base07})";
          position = "0, 120";
          halign = "center";
          valign = "center";
          shadow_passes = 3;
          shadow_size = 5;
          shadow_color = "rgb(${colors.base10})";
          shadow_boost = 1.3;
        }
      ];
    };
  };
}
