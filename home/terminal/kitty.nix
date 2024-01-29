{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
        linux_display_server = "wayland";
        wayland_titlebar_color = "background";

        font_family = "JetBrainsMono Nerd Font";
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";

        font_size = "13";
        background_opacity  = "0.6";
    };
  };    
}