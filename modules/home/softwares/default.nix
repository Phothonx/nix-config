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
}