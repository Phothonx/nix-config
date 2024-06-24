{ pkgs, ... }:
{
  imports = 
  [
    ./discord
    ./firefox
    ./utils
    ./spotify
    ./terminal
  ];

  home.packages = with pkgs; [
    bitwarden-desktop
  ];
}
