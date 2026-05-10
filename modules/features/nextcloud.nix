{self, ...}: {
  flake.nixosModules.nextcloud = {pkgs, ...}: {
    # imports = [
    #   self.nixosModules.impermanence
    # ];

    systemd.tmpfiles.rules = [
      "d /data/nextcloud 0750 nextcloud nextcloud -"
    ];

    services.nextcloud = {
      enable = true;
      package = pkgs.nextcloud30;
      home = "/data/nextcloud";
      datadir = "/data/nextcloud";
      database.createLocally = true;

      hostName = "192.168.0.8";
      https = false;
    };

    networking.firewall.allowedTCPPorts = [8080];

    persist.directories = [
      "/var/lib/postgresql"
      "/var/lib/nextcloud"
    ];
  };
}
