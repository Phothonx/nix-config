{ inputs, config, colors, ... }:
{
  imports = [ inputs.hyprlock.homeManagerModules.hyprlock ];

  programs.hyprlock = {
    enable = true;
    general = {
      disable_loading_bar = true;
    };

    backgrounds = [{
      monitor = "";
      path = "${config.home.homeDirectory}/.dotfiles/wallpapers/aesthic-wallpapers/30.png";
      blur_size = 2;
      blur_passes = 3;
      noise = 0.020;
      contrast = 0.9;
      brightness = 0.83;
    }];

    input-fields = [{
      monitor = "";
      size = {
        width = 250;
        height = 75;
      };
      outline_thickness = 2;
      dots_spacing = 0.3;
      dots_center = true;
      outer_color = "rgb(${colors.base07})";
      inner_color = "rgb(${colors.base04})";
      font_color = "rgb(${colors.base05})";
      fade_on_empty = false;
      placeholder_text = ''<span font_family="Ubuntu Nerd Font" foreground="##${colors.base05}">Password...</span>'';
    }];

    labels = [{
      monitor = "";
      text = "$TIME";
      font_family = "Ubuntu Nerd Font";
      font_size = 50;
      color = "rgb(${colors.base05})";
      position = {
        x = 0;
        y = 80;
      };
        valign = "center";
        halign = "center";
      }];
  };
}