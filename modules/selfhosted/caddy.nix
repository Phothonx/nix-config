{
  flake.nixosModules.caddy = {
    services.caddy = {
      enable = true;
      openFirewall = true; # 443
      virtualHosts."immich.camlann".extraConfig = ''
        reverse_proxy localhost:2283
        tls internal
      '';
      virtualHosts."paperless.camlann".extraConfig = ''
        reverse_proxy localhost:28981
        tls internal
      '';
      virtualHosts."homepage.camlann".extraConfig = ''
        reverse_proxy localhost:8082
        tls internal
      '';
      virtualHosts."kuma.camlann".extraConfig = ''
        reverse_proxy localhost:3001
        tls internal
      '';
      virtualHosts."adguard.camlann".extraConfig = ''
        reverse_proxy localhost:3000
        tls internal
      '';
    };
  };
}
