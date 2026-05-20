{
  flake.nixosModules.starr = {...}: {
    systemd.tmpfiles.rules = [
      "d /data/starr/radarr 0755 radarr media -"
      "d /data/starr/sonarr 0755 sonarr media -"
      "d /data/starr/lidarr 0755 lidarr media -"
      "d /data/starr/bazarr 0755 bazarr media -"
      "d /data/starr/prowlarr 0755 prowlarr media -"

      "d /data/media/movies 0775 radarr media -"
      "d /data/media/tv 0775 sonarr media -"
      "d /data/media/music 07575 lidarr media -"
    ];

    users.groups.media = {};

    services.radarr = {
      enable = true; # 7878
      group = "media";
      dataDir = "/data/starr/radarr";
    };

    services.sonarr = {
      enable = true; # 8989
      group = "media";
      dataDir = "/data/starr/sonarr";
    };

    services.lidarr = {
      enable = true; # 8686
      group = "media";
      dataDir = "/data/starr/lidarr";
    };

    services.bazarr = {
      enable = true; # 6767
      group = "media";
      dataDir = "/data/starr/bazarr";
    };

    services.prowlarr = {
      enable = true; # 9696
      dataDir = "/data/starr/prowlarr";
    };

    services.flaresolverr.enable = true; # 8191
  };
}
