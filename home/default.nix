{ config, pkgs, userConfig, ... }:
{
  _module.args = rec {
    theme = import ../theme {inherit pkgs userConfig;};
    colors = theme.sheme.palette;
  };

  imports = [
    ./hypr
    ./theme
    ./firefox
    ./ide
    ./terminal
    ./discord
    ./sway
    ./rofi
    ./waybar
    ./cli
    ./programming
    ./dunst
  ];
}