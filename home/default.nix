{ lib, config, pkgs, userConfig, ... }:
{
  specialisation = {
    gruvbox.configuration = {
      _module.args = rec {
        colors = artwork.palette;
        artwork = import ./artwork/gruvbox.nix { inherit pkgs; };
      };
    };
  };

  imports =
  [
    ./deftest.nix

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
