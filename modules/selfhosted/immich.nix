{
  flake.nixosModules.immich = {
    systemd.tmpfiles.rules = [
      "d /data/immich 0750 immich immich -"
    ];

    services.immich = {
      enable = true; # 2283
      mediaLocation = "/data/immich";
      accelerationDevices = ["/dev/nvidia0"];
    };

    persist.directories = [
      "/var/lib/postgresql"
    ];
  };
}
