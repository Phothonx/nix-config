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
      bat.enable = true;
      eza.enable = true;
      lf.enable = true;
    };
}