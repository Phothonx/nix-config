{ pkgs, ... }: 
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
      
      bs-hl-color = "CBA6F7";
      caps-lock-bs-hl-color = "CBA6F7";
      caps-lock-key-hl-color = "CBA6F7";
      key-hl-color = "CBA6F7";
      
      font = "JetBrainsMono Nerd Font";
      font-size = 125;
      text-color = "CDD6F4";
      text-clear-color = "CDD6F4";
      text-caps-lock-color = "CDD6F4";
      text-ver-color = "CDD6F4";
      text-wrong-color = "CDD6F4";
      
      indicator-radius = 200;
      indicator-thickness = 22;
      
      inside-color = "1E1E2E";
      inside-clear-color = "1E1E2E";
      inside-caps-lock-color = "1E1E2E";
      inside-ver-color = "1E1E2E";
      inside-wrong-color = "1E1E2E";
      
      ring-color = "313244";
      ring-clear-color = "89B4FA";
      ring-caps-lock-color = "F9E2AF";
      ring-ver-color = "89B4FA";
      ring-wrong-color = "F38BA8"; 

      separator-color = "B4BEFE";
    };
  };
}