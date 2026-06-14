{
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
      file = ../../secrets/selfhosted_credentials.age;
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
      '';

      settings = {
        title = "Camlann";
        background = "http://homepage.camlann.local/leaves.png";

        theme = "dark";
        color = "emerald";
        language = "fr";

        cardBlur = "xl";
        headerStyle = "boxed";

        hideVersion = true;
        disableUpdateCheck = true;
        useEqualHeights = true;

        layout = {
          Media = {
            style = "row";
            columns = 2;
          };
          Documents = {
            style = "row";
          };
          Download = {
            style = "row";
            columns = 2;
            Torrent = {
              style = "column";
              header = false;
            };
            Management = {
              style = "column";
              header = false;
            };
          };
          Infra = {
            style = "column";
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
          Documents = [
            {
              Paperless = {
                icon = "paperless-ngx.png";
                href = "https://paperless.camlann.local";
                description = "Documents";

                widget = {
                  type = "paperlessngx";
                  url = "http://localhost:28981";
                  key = "{{HOMEPAGE_VAR_PAPERLESS_API_KEY}}";
                };
              };
            }
          ];
        }

        {
          Download = [
            {
              Torrent = [
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
            {
              Management = [
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
              ];
            }
          ];
        }

        {
          Infra = [
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
            {
              Beszel = {
                icon = "beszel.png";
                href = "https://beszel.camlann.local/system/fp9cvcdovzxylnm";
                description = "Monitoring";
              };
            }
            {
              Freebox = {
                icon = "router.png";
                href = "https://mafreebox.freebox.fr";
                description = "Routeur";
              };
            }
            {
              Homepage = {
                icon = "homepage.png";
                href = "https://homepage.camlann.local";
                description = "Dashboard";
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
