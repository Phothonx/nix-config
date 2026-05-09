{
  flake.nixosModules.immich = { ... }: {

    systemd.tmpfiles.rules = [
      "d /data/immich 0750 immich immich -"
    ];

    services.immich = {
      enable = true;
      mediaLocation = "/data/immich";
      openFirewall = true;
      host = "0.0.0.0";
      accelerationDevices = [ "/dev/nvidia0" ];
    };
  };
}
