{ config, ... }:
{
  _module.args = {
    theme = config.artwork;
    colors = config.artwork.palette;
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
    ./theme

    ./rofi
  ];
}
