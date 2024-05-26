{ pkgs, ... }:
{
  _module.args = rec {
    theme = import ./theme/theme.nix {inherit pkgs;};
    colors = theme.palette;
  };

  imports =
  [
    ./cli
    ./config
    ./dev
    ./gaming
    ./services
    ./softwares
    ./wayland

    ./rofi
  ];
}
