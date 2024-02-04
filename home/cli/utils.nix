{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      brightnessctl

      zip
      unzip
      ripgrep
    ];

    programs = {
      thefuck.enable = true;
      ripgrep.enable = true;
      fzf.enable = true;
    };
}