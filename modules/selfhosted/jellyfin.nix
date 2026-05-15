{
  flake.nixosModules.jellyfin = {pkgs, ...}: {

    systemd.tmpfiles.rules = [
      "d /data/jellyfin 0750 jellyfin jellyfin -"
    ];

    services.jellyfin = {
      enable = true; # 8096
      dataDir = "/data/jellyfin";

      hardwareAcceleration.type = "nvenc";
      hardwareAcceleration.enable = true;
      hardwareAcceleration.device = "/dev/nvidia0";
      transcoding.enableHardwareEncoding = true;
    };

    environment.systemPackages = [ pkgs.jellyfin-ffmpeg ];
  };
}
