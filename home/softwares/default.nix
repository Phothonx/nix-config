{ pkgs, ... }:
{
  imports = 
  [
    ./discord
    ./firefox
    ./gnome
    ./spotify
    ./terminal
  ];

  home.packages = with pkgs; [
    bitwarden-desktop
  ];
}
