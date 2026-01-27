{hostName, ...}: {
  networking = {
    inherit hostName;
    networkmanager.enable = true;
  };

  networking.firewall.allowedTCPPorts = [
    # localsend
    53317
    # mindustry
    5667
  ];
  networking.firewall.allowedUDPPorts = [
    # localsend
    53317
    # mindustry
    5667
  ];

  # https://github.com/NixOS/nixpkgs/issues/180175
  systemd.services.NetworkManager-wait-online.enable = false;
}
