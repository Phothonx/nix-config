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
                icon = "adguard.png";
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
          ];
        }
      ];
    };
  };
}
