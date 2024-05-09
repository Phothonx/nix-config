{ inputs, config, theme, colors, ... }:
{
  imports = [ inputs.hyprlock.homeManagerModules.hyprlock ];

  programs.hyprlock = {
    enable = true;
    general = {
      hide_cursor = false;
      disable_loading_bar = true;
      ignore_empty_input = true;
    };

    backgrounds = [{
      monitor = "";
      path = "${theme.wallpaper}";
      blur_size = 3;
      blur_passes = 3;
      noise = 0.011;
      contrast = 0.9;
      brightness = 0.83;
    }];

    input-fields = with colors; [{
      monitor = "";
      size = {
        width = 275;
        height = 60;
      };
      outline_thickness = 3;
      dots_size = 0.25;
      dots_spacing = 0.42;
      dots_center = true;
      dots_rounding = -2;
      outer_color = "rgb(${base0E})";
      inner_color = "rgb(${base07})";
      font_color = "rgb(${base01})";
      check_color = "rgb(${base0B})";
      fail_color = "rgb(${base08})";
      fail_text = "rgb(${base0A})";
      fade_on_empty = true;
      fade_timeout = 3000;
      placeholder_text = ''<span font_family="${theme.fonts.sansSerif}" foreground="##${colors.base04}">Password...</span>'';
      rounding = 15;
      shadow_passes = 3;
      shadow_size = 4;
      shadow_color = "rgb(${colors.base10})";
      shadow_boost = 1.2;
      position = {
        x = 0;
        y = -40;
      };
    }];

    labels = [{
      monitor = "";
      text = ''<span font_weight="bold">$TIME</span>'';
      font_family = theme.fonts.sansSerif;
      font_size = 100;
      color = "rgb(${colors.base07})";
      position = {
        x = 0;
        y = 140;
      };
      shadow_passes = 3;
      shadow_size = 5;
      shadow_color = "rgb(${colors.base10})";
      shadow_boost = 1.3;
      }];
  };
}
