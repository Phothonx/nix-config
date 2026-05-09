{
  flake.nixosModules.nextcloud = { config, lib, pkgs, ... }: {

    systemd.tmpfiles.rules = [
      "d /data/nextcloud 0750 nextcloud nextcloud -"
    ];

    services.nextcloud = {
      enable = true;
      package = pkgs.nextcloud30;
      home = "/data/nextcloud";
      datadir = "/data/nextcloud";

      hostName = "192.168.0.8";
      https = false;

      config = {
        adminuser = "admin";
        adminpassFile = "/secrets/nextcloud/adminpass";
        dbtype = "pgsql";
      };

      database.createLocally = true;

      settings = {
        default_phone_region = "FR";
        default_locale = "fr_FR";
        overwriteprotocol = "http";
        trusted_domains = [
          "192.168.0.8"
          "localhost"
        ];

        maintenance_window_start = 3;
      };

      maxUploadSize = "10G";
      phpOptions = {
        "opcache.interned_strings_buffer" = "16";
        "opcache.max_accelerated_files" = "10000";
        "opcache.memory_consumption" = "128";
        "opcache.save_comments" = "1";
        "opcache.revalidate_freq" = "1";
      };
    };

    networking.firewall.allowedTCPPorts = [ 8080 ];
  };
}
