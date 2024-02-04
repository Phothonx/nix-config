{ pkgs, ... }:
{
  imports =
  [
    ./hyprland.nix
    ./env.nix
  ];

  home.packages = with pkgs;
  [
    swww
  ];
}