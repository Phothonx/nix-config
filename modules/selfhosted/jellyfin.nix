{
  flake.nixosModules.jellyfin = {pkgs, lib, ...}: {

    systemd.tmpfiles.rules = [
      "d /data/jellyfin 0750 jellyfin jellyfin -"
    ];

    users.users.jellyfin.extraGroups = [ "video" "render" ];

    systemd.services.jellyfin.serviceConfig = {
      DeviceAllow = lib.mkForce [
        "/dev/nvidia0 rw"
        "/dev/nvidiactl rw"
        "/dev/nvidia-uvm rw"
        "/dev/nvidia-uvm-tools rw"
        "/dev/nvidia-modeset rw"
      ];
      PrivateUsers = lib.mkForce false;
    };

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
