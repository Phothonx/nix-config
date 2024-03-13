{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome.nautilus
    nautilus-open-any-terminal
  ];
}