{
  flake.nixosModules.gitea = {
    services.gitea = {
      enable = true; # 3001 (3000 is taken by adguard)
      appName = "Camlann Git";

      # sqlite keeps everything self-contained under stateDir; no postgres needed
      database.type = "sqlite3";
      lfs.enable = true;

      settings = {
        server = {
          # DOMAIN was removed upstream; ROOT_URL alone is now authoritative.
          ROOT_URL = "https://git.camlann.local/";
          HTTP_ADDR = "127.0.0.1";
          HTTP_PORT = 3001;
        };
        service = {
          DISABLE_REGISTRATION = true;
          REQUIRE_SIGNIN_VIEW = true; # LAN-only, keep repos private
        };
      };
    };

    persist.directories = [
      "/var/lib/gitea"
    ];
  };
}
