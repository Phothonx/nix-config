{ artwork, colors, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = false;
        disable_loading_bar = true;
        ignore_empty_input = true;
        grace = 5;
      };

      background = [
        {
          monitor = "";
          path = "${./../../artwork/wallpapers/magma.png}";
          # blur_size = 3;
          # blur_passes = 3;
          # noise = 0.011;
          # contrast = 0.9;
          # brightness = 0.83;
          # vibrancy = 0.1696;
          # vibrancy_darkness = 0.0;
        }
      ];

      input-field = with colors; [
        {
          monitor = "";
          size = "250, 50";
          outline_thickness = 2;
          dots_size = 0.25;
          dots_spacing = 0.5;
          dots_center = true;
          dots_rounding = -1;
          outer_color = "rgb(${base0E})";
          inner_color = "rgb(${base00})";
          font_color = "rgb(${base07})";
          check_color = "rgb(${base0A})";
          fail_color = "rgb(${base08})";
          fail_text = "<i><span foreground=\"##${base08}\">$FAIL ($ATTEMPTS)</span></i>";
          fail_transition = 300;
          fade_on_empty = true;
          fade_timeout = 3000;
          placeholder_text = "<i>Password...</i>";
          rounding = 15;
          position = "0, 60";
          halign = "center";
          valign = "bottom";
          shadow_passes = 2;
          shadow_size = 4;
          shadow_color = "rgb(${colors.base10})";
        }
      ];

      label = [
        {
          monitor = "";
          text = "cmd[update:1000] echo \"<b><big> $(date +\"%H\") </big></b>\"";
          color = "rgb(${colors.base07})";
          font_size = 120;
          font_family = artwork.fonts.normal.name;
          position = "0, 20";
          halign = "center";
          valign = "center";
          shadow_passes = 2;
          shadow_size = 4;
          shadow_color = "rgb(${colors.base10})";
        }
        {
          monitor = "";
          text = "cmd[update:1000] echo \"<b><big> $(date +\"%M\") </big></b>\"";
          color = "rgb(${colors.base07})";
          font_size = 120;
          font_family = artwork.fonts.normal.name;
          position = "0, -140";
          halign = "center";
          valign = "center";
          shadow_passes = 2;
          shadow_size = 4;
          shadow_color = "rgb(${colors.base10})";
        }
        {
          monitor = "";
          text = "cmd[update:1000] echo \"<b><big> $(date +\"%d %b\") </big></b>\"";
          color = "rgb(${colors.base03})";
          font_size = 16;
          font_family = artwork.fonts.normal.name;
          position = "0, -160";
          halign = "center";
          valign = "center";
          shadow_passes = 2;
          shadow_size = 4;
          shadow_color = "rgb(${colors.base10})";
        }
        {
          monitor = "";
          text = "cmd[update:1000] echo \"<b><big> $(date +\"%A\") </big></b>\"";
          color = "rgb(${colors.base03})";
          font_size = 16;
          font_family = artwork.fonts.normal.name;
          position = "0, -180";
          halign = "center";
          valign = "center";
          shadow_passes = 2;
          shadow_size = 4;
          shadow_color = "rgb(${colors.base10})";         
        }
      ];
    };
  };
}
