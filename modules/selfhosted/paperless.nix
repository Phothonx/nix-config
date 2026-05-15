{
  flake.nixosModules.paperless = {

    systemd.tmpfiles.rules = [
      "d /data/paperless 0750 paperless paperless -"
    ];

    services.paperless = {
      enable = true; # 28981
      dataDir = "/data/paperless";

      settings = {
        PAPERLESS_ACCOUNT_ALLOW_SIGNUPS = false;
        PAPERLESS_SOCIALACCOUNT_ALLOW_SIGNUPS = false;
        PAPERLESS_URL = "https://paperless.camlann.local";
        PAPERLESS_CSRF_TRUSTED_ORIGINS = "https://paperless.camlann.local";
      };
    };
  };
}
