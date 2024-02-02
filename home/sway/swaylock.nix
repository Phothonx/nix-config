{ pkgs, colors, ... }: 
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      hide-keyboard-layout = true;
      indicator-caps-lock = true;
      indicator = true;
      clock = true;
      line-uses-inside = true;
      
      timestr = "%H:%M:%S";
      datestr = "%a %d %b";
      
      bs-hl-color = colors.base0E;
      caps-lock-bs-hl-color = colors.base0E;
      caps-lock-key-hl-color = colors.base0E;
      key-hl-color = colors.base0E;
      
      font = "JetBrainsMono Nerd Font";
      font-size = 85;
      text-color = colors.base05;
      text-clear-color = colors.base05;
      text-caps-lock-color = colors.base05;
      text-ver-color = colors.base05;
      text-wrong-color = colors.base05;
      
      indicator-radius = 250;
      indicator-thickness = 25;
      
      inside-color = colors.base00;
      inside-clear-color = colors.base00;
      inside-caps-lock-color = colors.base00;
      inside-ver-color = colors.base00;
      inside-wrong-color = colors.base00;
      
      ring-color = colors.base02;
      ring-clear-color = colors.base0D;
      ring-caps-lock-color = colors.base0A;
      ring-ver-color = colors.base0D;
      ring-wrong-color = colors.base08; 

      separator-color = colors.base02;
    };
  };
}