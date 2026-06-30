{
  flake.nixosModules.starr = {config, ...}: {
    systemd.tmpfiles.rules = [
      "d /data/starr/radarr 0755 radarr media -"
      "d /data/starr/sonarr 0755 sonarr media -"
      "d /data/starr/lidarr 0755 lidarr media -"
      "d /data/starr/bazarr 0755 bazarr media -"
      "d /data/starr/prowlarr 0755 prowlarr media -"

      "d /data/media/movies 0775 radarr media -"
      "d /data/media/tv 0775 sonarr media -"
      "d /data/media/music 0775 lidarr media -"
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

    age.secrets.radarr-api.file = ../../secrets/selfhosted/radarr-api.age;
    age.secrets.sonarr-api.file = ../../secrets/selfhosted/sonarr-api.age;

    services.recyclarr = {
      enable = true;
      group = "media";
      schedule = "weekly";
      configuration = {
        # nix-shell -p recyclarr.out --run 'recyclarr list quality-profiles radarr'
        radarr = {
          radarr-main = {
            api_key._secret = config.age.secrets.radarr-api.path;
            base_url = "http://localhost:7878";
            delete_old_custom_formats = true;
            quality_definition.type = "movie";
            quality_profiles = [
              {
                trash_id = "722b624f9af1e492284c4bc842153a38";
                reset_unmatched_scores.enabled = true;
              }
              {
                trash_id = "d1d67249d3890e49bc12e275d989a7e9";
                reset_unmatched_scores.enabled = true;
              }
            ];
          };
        };

        sonarr = {
          sonarr-main = {
            api_key._secret = config.age.secrets.sonarr-api.path;
            base_url = "http://localhost:8989";
            delete_old_custom_formats = true;
            quality_definition.type = "series";
            quality_profiles = [
              {
                trash_id = "9d142234e45d6143785ac55f5a9e8dc9";
                reset_unmatched_scores.enabled = true;
              }
              {
                trash_id = "20e0fc959f1f1704bed501f23bdae76f";
                reset_unmatched_scores.enabled = true;
              }
            ];
          };
        };
      };
    };

    services.flaresolverr.enable = true; # 8191

    virtualisation.oci-containers.containers.byparr = {
      image = "ghcr.io/thephaseless/byparr:latest";
      ports = ["8192:8192"];
      environment = {
        TZ = "Europe/Paris";
        PORT = "8192";
        LOG_LEVEL = "info";
      };
      autoStart = true;
    };
  };
}
