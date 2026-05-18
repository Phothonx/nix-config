
{
  flake.nixosModules.starr = {...}: {
    systemd.tmpfiles.rules = [
      "d /data/starr/radarr 0750 radarr radarr -"
      "d /data/starr/sonarr 0750 sonarr sonarr -"
      "d /data/starr/lidarr 0750 lidarr lidarr -"
      "d /data/starr/bazarr 0750 bazarr bazarr -"
      "d /data/starr/prowlarr 0750 bazarr bazarr -"
    ];

    services.radarr = {
      enable = true; # 7878
      dataDir = "/data/starr/radarr";
    };

    services.sonarr = {
      enable = true; # 8989
      dataDir = "/data/starr/sonarr";
    };

    services.lidarr = {
      enable = true; # 8686
      dataDir = "/data/starr/lidarr";
    };

    services.bazarr = {
      enable = true; # 6767
      dataDir = "/data/starr/bazarr";
    };

    services.prowlarr = {
      enable = true; # 9696
      dataDir = "/data/starr/prowlarr";
    };
  };
}
