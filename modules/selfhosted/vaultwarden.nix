{
  # Vaultwarden: lightweight, Bitwarden-compatible server (works with the
  # Bitwarden apps/extension already in packages/firefox/policies.json).
  flake.nixosModules.vaultwarden = {config, ...}: {
    # ADMIN_TOKEN for the /admin panel, kept out of the nix store.
    # Env-file format, one line: ADMIN_TOKEN=$argon2id$v=19$...
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

        # the first account you register becomes your vault. flip to false and
        # nh os switch again once registered to lock the instance down.
        SIGNUPS_ALLOWED = true;
      };
    };

    persist.directories = [
      "/var/lib/vaultwarden"
    ];
  };
}