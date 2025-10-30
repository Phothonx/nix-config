{...}: {
  imports = [
    ./adb.nix
    ./openvpn.nix
    ./gaming.nix
    # ./agenix.nix
    ./sops.nix
    ./bluetooth.nix
    ./fish.nix
    ./greetd.nix
    ./hyprland.nix
    ./networking.nix
    ./nh.nix
    ./pipewire.nix
    # ./ssh.nix
    # ./quietboot.nix
    ./systemd-boot.nix
    # ./tlp.nix
    ./xkb.nix
    ./steam.nix
    ./graphics.nix
    ./nix-ld.nix
    ./udev.nix
    # ./upower.nix
  ];
}
