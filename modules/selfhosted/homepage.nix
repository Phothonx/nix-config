{
  flake.nixosModules.homepage = {
    services.homepage-dashboard = {
      enable = true;
      openFirewall = true;
      allowedHosts = "*";

      settings = {
        title = "Camlann";
        theme = "dark";
        color = "slate";
        headerStyle = "clean";
        quicklaunch = {
          searchDescriptions = true;
          hideInternetSearch = true;
          provider = "custom";
          url = "https://search.brave.com/search?q=";
          target = "_blank";
        };
        layout = {
          Media = {
            style = "row";
            columns = 3;
          };
          Storage = {
            style = "row";
            columns = 3;
          };
        };
      };

      widgets = [
        {
          resources = {
            cpu = true;
            memory = true;
            disk = "/";
          };
        }
        {
          resources = {
            label = "HDD";
            disk = "/data";
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
          Media = [
            {
              Immich = {
                icon = "immich.png";
                href = "http://192.168.0.8:2283";
                description = "Photos";
                widget = {
                  type = "immich";
                  url = "http://127.0.0.1:2283";
                  # key = "";
                };
              };
            }
          ];
        }
        {
          Storage = [
            {
              Paperless = {
                icon = "paperless-ngx.png";
                href = "http://192.168.0.8:28981";
                description = "Documents";
                widget = {
                  type = "paperlessngx";
                  url = "http://127.0.0.1:28981";
                  # key = "";
                };
              };
            }
          ];
        }
      ];
    };
  };
}
