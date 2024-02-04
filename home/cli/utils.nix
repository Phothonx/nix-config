{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      brightnessctl
      upower

      zip
      unzip
    ];

    programs = {
      thefuck.enable = true;
      ripgrep.enable = true;
      fzf.enable = true;
    };
}