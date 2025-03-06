{config, ...}: let
  inherit (config) fontsProfiles colorScheme lockimg;
in {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        disable_loading_bar = true;
        ignore_empty_input = true;
      };

      animations = {
        bezier = [
          "linear, 1, 1, 0, 0"
        ];
        animation = [
          "fade, 1, 6, linear"
        ];
      };

      background = [
        {
          path = "screenshot";
          blur_size = 13;
          blur_passes = 3;
          vibrancy_darkness = 2.0;
          vibrancy = 0.1696;
        }
      ];

      input-field = with colorScheme.palette; [
        {
          size = "250, 50";
          outline_thickness = 2;
          dots_spacing = 0.5;
          dots_rounding = -1;
          outer_color = "rgb(${b_grey})";
          inner_color = "rgb(${background})";
          font_color = "rgb(${foreground})";
          font_family = fontsProfiles.regular.name;
          check_color = "rgb(${b_yellow})";
          fail_color = "rgb(${red})";
          fail_text = "<i><span foreground=\"##${red}\">$FAIL ($ATTEMPTS)</span></i>";
          fade_on_empty = true;
          fade_timeout = 4000;
          placeholder_text = "<i><span foreground=\"##${grey}\">Input Password...</span></i>";
          rounding = 0;
          position = "0, 100";
          halign = "center";
          valign = "bottom";

          shadow_passes = 2;
          shadow_size = 6;
          shadow_color = "rgb(000000)";
          shadow_boost = 0.9;
        }
      ];

      label = with colorScheme.palette; [
        {
          monitor = "";
          text = "cmd[update:1000] echo \"<b><big> $(date +\"%H\") </big></b>\"";
          color = "rgb(${foreground})";
          font_size = 150;
          font_family = fontsProfiles.regular.name;
          position = "0, 120";
          halign = "center";
          valign = "center";

          shadow_passes = 2;
          shadow_size = 6;
          shadow_color = "rgb(000000)";
          shadow_boost = 0.9;
        }
        {
          monitor = "";
          text = "cmd[update:1000] echo \"<b><big> $(date +\"%M\") </big></b>\"";
          color = "rgb(${foreground})";
          font_size = 150;
        font_family = fontsProfiles.regular.name;
          position = "0, -50";
          halign = "center";
          valign = "center";

          shadow_passes = 2;
          shadow_size = 6;
          shadow_color = "rgb(000000)";
          shadow_boost = 0.9;
        }
        {
          monitor = "";
          text = "cmd[update:1000] echo \"<b><big> $(date +\"%d %b\") </big></b>\"";
          color = "rgb(${grey})";
          font_size = 20;
          font_family = fontsProfiles.regular.name;
          position = "0, -180";
          halign = "center";
          valign = "center";

          shadow_passes = 2;
          shadow_size = 6;
          shadow_color = "rgb(000000)";
          shadow_boost = 0.9;
        }
        {
          monitor = "";
          text = "cmd[update:1000] echo \"<b><big> $(date +\"%A\") </big></b>\"";
          color = "rgb(${grey})";
          font_size = 20;
          font_family = fontsProfiles.regular.name;
          position = "0, -210";
          halign = "center";
          valign = "center";

          shadow_passes = 2;
          shadow_size = 6;
          shadow_color = "rgb(000000)";
          shadow_boost = 0.9;
        }
      ];
    };
  };
}
