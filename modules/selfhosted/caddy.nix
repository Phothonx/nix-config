{
  flake.nixosModules.caddy = {pkgs, ...}: {
    systemd.services.caddy.path = [pkgs.nssTools];
    services.caddy = {
      enable = true;
      openFirewall = true; # 443 (https) 80 (http)
      virtualHosts."immich.camlann.local".extraConfig = ''
        tls internal
        reverse_proxy localhost:2283
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
      virtualHosts."navidrome.camlann.local".extraConfig = ''
        tls internal
        reverse_proxy localhost:4533
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
      virtualHosts."bazarr.camlann.local".extraConfig = ''
        tls internal
        reverse_proxy localhost:6767
      '';
      virtualHosts."prowlarr.camlann.local".extraConfig = ''
        tls internal
        reverse_proxy localhost:9696
      '';
      virtualHosts."git.camlann.local".extraConfig = ''
        tls internal
        reverse_proxy localhost:3001
      '';
      virtualHosts."vault.camlann.local".extraConfig = ''
        tls internal
        reverse_proxy localhost:8222
      '';
      virtualHosts."sync.camlann.local".extraConfig = ''
        tls internal
        # Syncthing's GUI rejects a proxied Host header ("Host check error"),
        # so rewrite it to localhost. Set a GUI user/password in the web UI —
        # caddy makes this reachable to the whole LAN.
        reverse_proxy localhost:8384 {
          header_up Host localhost:8384
        }
      '';
    };

    persist.directories = [
      "/var/lib/caddy"
    ];
  };
}
