{
  flake.nixosModules.caddy = {pkgs, ...}: {
    systemd.services.caddy.path = [ pkgs.nssTools ];
    services.caddy = {
      enable = true;
      openFirewall = true; # 443 (https) 80 (http)
      virtualHosts."immich.camlann.local".extraConfig = ''
        tls internal
        reverse_proxy localhost:2283
      '';
      virtualHosts."paperless.camlann.local".extraConfig = ''
        tls internal
        reverse_proxy localhost:28981
      '';
      virtualHosts."beszel.camlann.local".extraConfig = ''
        tls internal
        reverse_proxy localhost:8090
      '';
      virtualHosts."homepage.camlann.local".extraConfig = ''
        tls internal
        reverse_proxy localhost:8082
        handle /leaves.png {
          root * ${../../wallpapers}
          file_server
        }
      '';
      virtualHosts."adguard.camlann.local".extraConfig = ''
        tls internal
        reverse_proxy localhost:3000
      '';
      virtualHosts."jellyfin.camlann.local".extraConfig = ''
        tls internal
        reverse_proxy localhost:8096
      '';
      virtualHosts."qbit.camlann.local".extraConfig = ''
        tls internal
        reverse_proxy localhost:8080
      '';
      virtualHosts."radarr.camlann.local".extraConfig = ''
        tls internal
        reverse_proxy localhost:7878
      '';
      virtualHosts."sonarr.camlann.local".extraConfig = ''
        tls internal
        reverse_proxy localhost:8989
      '';
      # virtualHosts."lidarr.camlann.local".extraConfig = ''
      #   tls internal
      #   reverse_proxy localhost:8686
      # '';
      virtualHosts."bazarr.camlann.local".extraConfig = ''
        tls internal
        reverse_proxy localhost:6767
      '';
      virtualHosts."prowlarr.camlann.local".extraConfig = ''
        tls internal
        reverse_proxy localhost:9696
      '';
    };

    persist.directories = [
      "/var/lib/caddy"
    ];
  };
}
