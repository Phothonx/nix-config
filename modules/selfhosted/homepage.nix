{self, ...}: {
  flake.nixosModules.homepage = {config, ...}: {
    services.beszel = {
      hub = {
        enable = true;
        host = "127.0.0.1";
        port = 8090;
      };
      agent = {
        extraPath = [config.hardware.nvidia.package];
        environment.KEY = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGyHh3zJegqX32T/6UFfSw7U+erGoSafu2lfxdSrSpc7";
        enable = true;
        smartmon.enable = true;
      };
    };

    age.secrets.selfhosted_credentials = {
      file = ../../secrets/selfhosted/selfhosted_credentials.age;
      owner = "homepage";
    };

    services.homepage-dashboard = {
      enable = true; # 8082
      allowedHosts = "*";
      environmentFiles = [config.age.secrets.selfhosted_credentials.path];
      customCSS = ''
        @import url('https://fonts.bunny.net/css?family=ubuntu:300,400,500,700');
        * {
          font-family: 'Ubuntu', sans-serif !important;
        }

        /* Solid, blur-free cards (no transparency = no GPU lag) */
        .service-card,
        .bookmark-card,
        #information-widgets {
          background-color: ${self.theme.base02} !important;
          backdrop-filter: none !important;
        }
      '';

      settings = {
        title = "Camlann";
        background = "http://homepage.camlann.local/leaves.png";

        theme = "dark";
        color = "white";
        language = "fr";

        cardBlur = "none";
        headerStyle = "boxed";

        hideVersion = true;
        disableUpdateCheck = true;
        useEqualHeights = true;

        layout = {
          Media = {
            style = "row";
            columns = 2;
          };
          Outils = {
            style = "row";
            columns = 2;
          };
          Apps = {
            style = "row";
            columns = 6;
            iconsOnly = true;
          };
          Infra = {
            style = "row";
            columns = 5;
            iconsOnly = true;
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
            network = true;
            units = "metric";
            disk = ["/" "/data"];
          };
        }
      ];

      services = [
        {
          Media = [
            {
              Jellyfin = {
                icon = "jellyfin.png";
                href = "https://jellyfin.camlann.local";
                description = "Films & séries";

                widget = {
                  type = "jellyfin";
                  url = "http://localhost:8096";
                  key = "{{HOMEPAGE_VAR_JELLYFIN_API_KEY}}";
                };
              };
            }
            {
              Immich = {
                icon = "immich.png";
                href = "https://immich.camlann.local";
                description = "Photos";

                widget = {
                  version = "2";
                  type = "immich";
                  url = "http://localhost:2283";
                  key = "{{HOMEPAGE_VAR_IMMICH_API_KEY}}";
                };
              };
            }
          ];
        }

        {
          Outils = [
            {
              QbitTorrent = {
                icon = "qbittorrent.png";
                href = "https://qbit.camlann.local";
                description = "Téléchargements";

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
              AdGuard = {
                icon = "adguard-home.png";
                href = "https://adguard.camlann.local";
                description = "DNS";

                widget = {
                  type = "adguard";
                  url = "http://localhost:3000";
                  username = "{{HOMEPAGE_VAR_ADGUARD_USERNAME}}";
                  password = "{{HOMEPAGE_VAR_ADGUARD_PASSWORD}}";
                };
              };
            }
          ];
        }

        {
          Apps = [
            {
              Seafile = {
                icon = "seafile.png";
                href = "https://seafile.camlann.local";
              };
            }
            {
              Prowlarr = {
                icon = "prowlarr.png";
                href = "https://prowlarr.camlann.local";
              };
            }
            {
              Sonarr = {
                icon = "sonarr.png";
                href = "https://sonarr.camlann.local";
              };
            }
            {
              Radarr = {
                icon = "radarr.png";
                href = "https://radarr.camlann.local";
              };
            }
            {
              Lidarr = {
                icon = "lidarr.png";
                href = "https://lidarr.camlann.local";
              };
            }
            {
              Bazarr = {
                icon = "bazarr.png";
                href = "https://bazarr.camlann.local";
              };
            }
          ];
        }

        {
          Infra = [
            {
              Gitea = {
                icon = "gitea.png";
                href = "https://git.camlann.local";
              };
            }
            {
              Vaultwarden = {
                icon = "vaultwarden.png";
                href = "https://vault.camlann.local";
              };
            }
            {
              Beszel = {
                icon = "beszel.png";
                href = "https://beszel.camlann.local/system/fp9cvcdovzxylnm";
              };
            }
            {
              Freebox = {
                icon = "router.png";
                href = "https://mafreebox.freebox.fr";
              };
            }
            {
              Homepage = {
                icon = "homepage.png";
                href = "https://homepage.camlann.local";
              };
            }
          ];
        }
      ];
    };

    persist.directories = [
      "/var/lib/beszel"
      "/var/lib/private/beszel-hub"
    ];
  };
}
