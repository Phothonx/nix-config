{
  flake.nixosModules.caddy = {
    # TODO move virtualHosts to corresponding & open 443 port
    services.caddy = {
      enable = true;
      virtualHosts."immich.camlann".extraConfig = ''
        reverse_proxy localhost:2283
        tls internal  # self-signed, trusted on LAN devices
      '';
      virtualHosts."paperless.camlann".extraConfig = ''
        reverse_proxy localhost:28981
        tls internal
      '';
    };
  };
}
