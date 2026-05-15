{
  flake.nixosModules.qbittorrent = {config, ...}: {

    systemd.tmpfiles.rules = [
      "d /data/qBittorrent 0750 qbittorrent qbittorrent -"
    ];

    age.secrets.protonvpn-key = {
      file = ../../secrets/protonvpn-key.age;
    };

    networking.wg-quick.interfaces.qbproton = {
      configFile = config.age.secrets.protonvpn-key.path;
    };

    services.qbittorrent = {
      enable = true; # 8080
      profileDir = "/data/qBittorrent/";
    };

    networking.firewall.allowedTCPPorts = [];
  };
}
