{ inputs, config, theme, colors, ... }:
{
  imports = [ inputs.hyprlock.homeManagerModules.hyprlock ];

  programs.hyprlock = {
    enable = true;
    general = {
      disable_loading_bar = true;
    };

    backgrounds = [{
      monitor = "";
      path = "${theme.wallpaper}";
      blur_size = 3;
      blur_passes = 3;
      noise = 0.018;
      contrast = 0.9;
      brightness = 0.83;
    }];

    input-fields = with colors; [{
      monitor = "";
      size = {
        width = 265;
        height = 65;
      };
      outline_thickness = 3;
      dots_size = 0.2;
      dots_spacing = 0.2;
      dots_center = true;
      # dots_rounding = -2;
      outer_color = "rgb(${base17})";
      inner_color = "rgb(${base07})";
      font_color = "rgb(${base00})";
      fade_on_empty = false;
      placeholder_text = ''<span font_family="${theme.fonts.sansSerif}" foreground="##${colors.base04}">Password...</span>'';
      rounding = 15;
      # shadow_passes = 2;
      # shadow_color = "rgb(${colors.base10})";
    }];

    labels = [{
      monitor = "";
      text = "$TIME";
      font_family = theme.fonts.sansSerif;
      font_size = 75;
      color = "rgb(${colors.base07})";
      # shadow_passes = 2;
      # shadow_color = "rgb(${colors.base10})";
      }];
  };
}