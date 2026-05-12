{
  flake.nixosModules.homepage = {
    services.homepage-dashboard = {
      enable = true; # 8082
      allowedHosts = "*";

      settings = {
        title = "Camlann";
        description = "Fait par Nicolas !";
        background = ../../wallpapers/leaves.png;
        cardBlur = "xs";
        theme = "dark";
        color = "zinc";
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
                  type = "immich";
                  url = "http://localhost:2283";
                  # key = "";
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
                  # key = "";
                };
              };
            }


            {
              AdGuard= {
                icon = "adguard.png";
                href = "https://adguard.camlann.local";
                widget = {
                  type = "adguard";
                  # username = "";
                  # password = "";
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
                  # key = "";
                };
              };
            }

            {
              QbitTorrent = {
                icon = "qbittorrent.png";
                href = "https://qbit.camlann.local";
                widget = {
                  type = "qbittorent";
                  # username = "";
                  # password = "";
                };
              };
            }
          ];
        }
      ];
    };
  };
}
