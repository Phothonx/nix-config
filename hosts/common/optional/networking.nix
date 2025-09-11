{hostName, ...}: {
  networking = {
    inherit hostName;
    networkmanager.enable = true;
  };

  networking.firewall.allowedTCPPorts = [
  ];

  networking.firewall.allowedUDPPorts = [
  ];

  # https://github.com/NixOS/nixpkgs/issues/180175
  systemd.services.NetworkManager-wait-online.enable = false;
}
