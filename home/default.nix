{ config, ... }:
let
  colors = config.colorScheme.colors; # from nix-colors (./theme/colors.nix)
in
{
  _module.args.colors = colors;

  imports = [
    ./hyprland
    ./theme
    ./firefox
    ./ide
    ./terminal
    ./discord
    ./sway
    ./rofi
    ./waybar
    ./cli
    ./ags
  ];
}