{ pkgs, ... }:
{
  imports =
  [
    ./hyprland
    ./waybar

    ./hyprlock.nix
    ./walker.nix
  ];

  home.packages = with pkgs; [
    libnotify
    brightnessctl
    swww
    hyprshot

    pwvucontrol
    helvum
    imv

    hyprpicker
  ];
}
