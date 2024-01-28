{ self, config, pkgs, inputs, username, ... }:
{
  imports = [
    ./hyprland
    ./theme
    ./firefox
    ./ide
    ./terminal
    ./discord
    ./sway
    ./git
  ];
}