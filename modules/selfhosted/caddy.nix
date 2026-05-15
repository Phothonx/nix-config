{
  flake.nixosModules.caddy = {
    services.caddy = {
      enable = true;
      openFirewall = true; # 443 (https) 80 (http)
      virtualHosts."immich.camlann.local".extraConfig = ''
        reverse_proxy localhost:2283
      '';
      virtualHosts."paperless.camlann.local".extraConfig = ''
        reverse_proxy localhost:28981
      '';
      virtualHosts."homepage.camlann.local".extraConfig = ''
        reverse_proxy localhost:8082
        handle /leaves.png {
          root * ${../../wallpapers}
          file_server
        }
      '';
      virtualHosts."adguard.camlann.local".extraConfig = ''
        reverse_proxy localhost:3000
      '';
      virtualHosts."jellyfin.camlann.local".extraConfig = ''
        reverse_proxy localhost:8096
      '';
      virtualHosts."qbit.camlann.local".extraConfig = ''
        reverse_proxy localhost:8080
      '';
    };
  };
}
