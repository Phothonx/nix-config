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
          DOMAIN = "git.camlann.local";
          ROOT_URL = "https://git.camlann.local/";
          HTTP_ADDR = "127.0.0.1";
          HTTP_PORT = 3001;
        };
        service = {
          # the first registered user becomes the instance admin.
          # flip to true once you've created your account, then nh os switch again.
          DISABLE_REGISTRATION = false;
          REQUIRE_SIGNIN_VIEW = true; # LAN-only, keep repos private
        };
      };
    };

    persist.directories = [
      "/var/lib/gitea"
    ];
  };
}