{
  flake.nixosModules.caddy = { # 443 https
    services.caddy = {
      enable = true;
      virtualHosts."immich.camlann".extraConfig = ''
        reverse_proxy localhost:2283
        tls internal
      '';
      virtualHosts."paperless.camlann".extraConfig = ''
        reverse_proxy localhost:28981
        tls internal
      '';
    };
  };
}
