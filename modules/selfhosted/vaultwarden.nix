{
  flake.nixosModules.vaultwarden = {config, ...}: {
    age.secrets.vaultwarden-env.file = ../../secrets/vaultwarden-env.age;

    services.vaultwarden = {
      enable = true; # 8222
      dbBackend = "sqlite";
      domain = "vault.camlann.local"; # -> DOMAIN = https://vault.camlann.local
      environmentFile = config.age.secrets.vaultwarden-env.path;

      config = {
        ROCKET_ADDRESS = "127.0.0.1";
        ROCKET_PORT = 8222;
        ENABLE_WEBSOCKET = true; # live sync notifications (caddy proxies the ws)

        SIGNUPS_ALLOWED = true;
      };
    };

    persist.directories = [
      "/var/lib/vaultwarden"
    ];
  };
}
