{ pkgs, ... }:
{
  home.packages = with pkgs; [
    osu-lazer
    atlauncher
  ];
}
