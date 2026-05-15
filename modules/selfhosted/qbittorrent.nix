{
  flake.nixosModules.qbittorrent = {config, ...}: {

    systemd.tmpfiles.rules = [
      "d /data/qBittorrent 0750 qbittorrent qbittorrent -"
    ];

    age.secrets.protonvpn-wg = {
      file = ../../secrets/protonvpn-wg.age;
    };

    networking.wg-quick.interfaces.qbproton = {
      configFile = config.age.secrets.protonvpn-wg.path;
    };

    services.qbittorrent = {
      enable = true; # 8080
      profileDir = "/data/qBittorrent/";
    };

  };
}
