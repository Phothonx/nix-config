{
  flake.nixosModules.adguard = {
    services.adguardhome = {
      enable = true;

      settings = {
        dns = {
          bind_hosts = [ "0.0.0.0" ];
          port = 53;
        };

        filtering = {
          protection_enabled = true;
          filtering_enabled = true;
        };
      };
    };

    networking.firewall.allowedTCPPorts = [53];
    networking.firewall.allowedUDPPorts = [53];
  };
}
