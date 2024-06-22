{ pkgs, inputs, ... }:
{
  _module.args = rec {
    colors = artwork.palette;
    artwork = import ./../artwork { inherit pkgs; };
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
  ];
}
