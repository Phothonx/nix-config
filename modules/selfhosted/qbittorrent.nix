{
  flake.nixosModules.qbittorrent = {

    systemd.tmpfiles.rules = [
      "d /data/qBittorrent 0750 qbittorrent qbittorrent -"
    ];

    services.qbittorrent = {
      enable = true; # 8080
      profileDir = "/data/qBittorrent";
    };
  };
}
