{
  flake.nixosModules.homepage = {config, ...}: {
    age.secrets.selfhosted_credentials = {
      file = ../../secrets/selfhosted_credentials.age;
      owner = "homepage";
    };

    services.homepage-dashboard = {
      enable = true; # 8082
      allowedHosts = "*";
      environmentFiles = [ config.age.secrets.selfhosted_credentials.path ];
      customCSS = ''
        @import url('https://fonts.bunny.net/css?family=ubuntu:300,400,500,700');
        * {
          font-family: 'Ubuntu', sans-serif !important;
        }
      '';

      settings = {
        title = "Camlann homepage";
        background = "https://homepage.camlann.local/leaves.png";
        cardBlur = "md";
        theme = "dark";
        color = "emerald";
        language = "fr";
        headerStyle = "boxedWidgets";
        hideVersion = true;
        disableUpdateCheck = true;
        layout = {
          Services = {
            style = "row";
          };
        };
      };

      widgets = [
        {
          datetime = {
            text_size = "xl";
            dateStyle = "long";
            timeStyle = "long";
          };
        }
        {
          resources = {
            cpu = true;
            memory = true;
            uptime = true;
            units = "metric";
            network = true;
            disk = ["/" "/data"];
          };
        }
        {
          datetime = {
            text_size = "xl";
            format = {
              dateStyle = "short";
              timeStyle = "short";
              hour12 = false;
            };
          };
        }
      ];

      services = [
        {
          Services = [
            {
              Immich = {
                icon = "immich.png";
                href = "https://immich.camlann.local";
                widget = {
                  version = "2";
                  type = "immich";
                  url = "http://localhost:2283";
                  key = "{{HOMEPAGE_VAR_IMMICH_API_KEY}}";
                };
              };
            }

            {
              Paperless = {
                icon = "paperless-ngx.png";
                href = "https://paperless.camlann.local";
                widget = {
                  type = "paperlessngx";
                  url = "http://localhost:28981";
                  key = "{{HOMEPAGE_VAR_PAPERLESS_API_KEY}}";
                };
              };
            }


            {
              AdGuard= {
                icon = "adguard-home.png";
                href = "https://adguard.camlann.local";
                widget = {
                  url = "http://localhost:3000";
                  type = "adguard";
                  username = "{{HOMEPAGE_VAR_ADGUARD_USERNAME}}";
                  password = "{{HOMEPAGE_VAR_ADGUARD_PASSWORD}}";
                };
              };
            }

            {
              Jellyfin = {
                icon = "jellyfin.png";
                href = "https://jellyfin.camlann.local";
                widget = {
                  type = "jellyfin";
                  url = "http://localhost:8096";
                  key = "{{HOMEPAGE_VAR_JELLYFIN_API_KEY}}";
                };
              };
            }

            {
              QbitTorrent = {
                icon = "qbittorrent.png";
                href = "https://qbit.camlann.local";
                widget = {
                  type = "qbittorrent";
                  url = "http://localhost:8080";
                  username = "{{HOMEPAGE_VAR_QBIT_USERNAME}}";
                  password = "{{HOMEPAGE_VAR_QBIT_PASSWORD}}";
                  enableLeechProgress = true;
                  enableLeechSize = true;
                };
              };
            }
            {
              Radarr = {
                icon = "radarr.png";
                href = "https://radarr.camlann.local";
                widget = {
                  type = "radarr";
                  url = "http://localhost:7878";
                  key = "{{HOMEPAGE_VAR_RADARR_API_KEY}}";
                  enableQueue = true;
                };
              };
            }
            {
              Sonarr = {
                icon = "sonarr.png";
                href = "https://sonarr.camlann.local";
                widget = {
                  type = "sonarr";
                  url = "http://localhost:8989";
                  key = "{{HOMEPAGE_VAR_SONARR_API_KEY}}";
                  enableQueue = true;
                };
              };
            }
            {
              Lidarr = {
                icon = "lidarr.png";
                href = "https://lidarr.camlann.local";
                widget = {
                  type = "lidarr";
                  url = "http://localhost:8686";
                  key = "{{HOMEPAGE_VAR_LIDARR_API_KEY}}";
                };
              };
            }
            {
              Bazarr = {
                icon = "bazarr.png";
                href = "https://bazarr.camlann.local";
                widget = {
                  type = "bazarr";
                  url = "http://localhost:6767";
                  key = "{{HOMEPAGE_VAR_BAZARR_API_KEY}}";
                };
              };
            }
            {
              Prowlarr = {
                icon = "prowlarr.png";
                href = "https://prowlarr.camlann.local";
                widget = {
                  type = "prowlarr";
                  url = "http://localhost:9696";
                  key = "{{HOMEPAGE_VAR_PROWLARR_API_KEY}}";
                };
              };
            }
          ];
        }
      ];
    };
  };
}
