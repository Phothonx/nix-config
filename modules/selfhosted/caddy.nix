{
  flake.nixosModules.caddy = {
    services.caddy = {
      enable = true;
      openFirewall = true; # 443 (https) 80 (http)
      virtualHosts."immich.camlann.local".extraConfig = ''
        reverse_proxy localhost:2283
        tls internal
      '';
      virtualHosts."paperless.camlann.local".extraConfig = ''
        reverse_proxy localhost:28981
        tls internal
      '';
      virtualHosts."homepage.camlann.local".extraConfig = ''
        reverse_proxy localhost:8082
        tls internal
      '';
      virtualHosts."kuma.camlann.local".extraConfig = ''
        reverse_proxy localhost:3001
        tls internal
      '';
      virtualHosts."adguard.camlann.local".extraConfig = ''
        reverse_proxy localhost:3000
        tls internal
      '';
      virtualHosts."jellyfin.camlann.local".extraConfig = ''
        reverse_proxy localhost:8096
        tls internal
      '';
      virtualHosts."qbit.camlann.local".extraConfig = ''
        reverse_proxy localhost:8080
        tls internal
      '';
    };
  };
}
