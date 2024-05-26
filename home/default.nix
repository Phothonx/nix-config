{ config, pkgs, userConfig, ... }:
{
  _module.args = rec {
    colors = artwork.palette;
    artwork = import ./artwork/default.nix { inherit pkgs; };
  };

  imports =
  [
    ./cli
    ./config
    ./dev
    ./services
    ./softwares
    ./wayland
    ./gaming

    ./rofi
  ];
}
