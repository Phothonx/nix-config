{ pkgs, username, inputs, ... }:
{
  imports = [
    ./hyprland
    ./theme
    ./firefox
    ./ide
    ./terminal
    ./discord
    ./sway #utils
  ];
}