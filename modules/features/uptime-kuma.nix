{
  flake.nixosModules.uptime-kuma = {lib, ...}: {
    systemd.services.uptime-kuma.serviceConfig = {
      ReadWritePaths = ["/data/uptime-kuma"];
    };

    services.uptime-kuma = {
      enable = true;
      settings.PORT = "3001";
      settings.HOST = "0.0.0.0";
      settings.DATA_DIR = lib.mkForce "/data/uptime-kuma";
    };

    networking.firewall.allowedTCPPorts = [
      3001 # uptime kuma
    ];
  };
}
