{ pkgs, inputs, ... }:
{
  imports =
  [
    ./hyprland.nix
  ];

  home.packages = with pkgs;
  [
    swww
  ];
}