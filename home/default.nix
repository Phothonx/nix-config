{ config, pkgs, userConfig, ... }:
{
  _module.args = rec {
    theme = import ../theme {inherit pkgs userConfig;};
    colors = theme.sheme.palette;
  };

  imports =
  [
    ./cli
    ./config
    ./dev
    ./services
    ./softwares
    ./wayland

    ./rofi
  ];
}
