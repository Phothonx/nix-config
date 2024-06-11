{ ... }:
{
  imports =
  [
    ./hyprland
    ./waybar

    ./hyprlock.nix
  ];

  home.packages = with pkgs; [
    libnotify
    brightnessctl
    swww
    hyprshot

    pwvucontrol
    helvum
    imv

    wl-clipboard
    cliphist
    hyprpicker
  ];
}
