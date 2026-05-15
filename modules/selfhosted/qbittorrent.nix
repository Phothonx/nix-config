{
  flake.nixosModules.qbittorrent = {pkgs, ...}: {

    environment.systemPackages = [ pkgs.proton-vpn-cli ];

    systemd.tmpfiles.rules = [
      "d /data/qBittorrent 0750 qbittorrent qbittorrent -"
    ];

    services.qbittorrent = {
      enable = true; # 8080
      profileDir = "/data/qBittorrent/";
    };

    networking.firewall.allowedTCPPorts = [];
  };
}
