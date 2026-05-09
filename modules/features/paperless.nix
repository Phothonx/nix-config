{
  flake.nixosModules.paperless = { ... }: {

    systemd.tmpfiles.rules = [
      "d /data/paperless/documents  0750 paperless paperless -"
      "d /data/paperless/consume    0750 paperless paperless -"
      "d /data/paperless/media      0750 paperless paperless -"
    ];

    services.paperless = {
      enable = true;
      address = "0.0.0.0";
      dataDir = "/data/paperless/documents";
      mediaDir = "/data/paperless/media";
      consumptionDir = "/data/paperless/consume";
      consumptionDirIsPublic = false;

      settings = {
        PAPERLESS_OCR_LANGUAGE = "fra";
        PAPERLESS_TIME_ZONE = "Europe/Paris";
        PAPERLESS_OCR_MODE = "skip";
        PAPERLESS_TASK_WORKERS = 2;
        PAPERLESS_THREADS_PER_WORKER = 1;

        PAPERLESS_FILENAME_FORMAT = "{created_year}/{correspondent}/{title}";

        # Security
        PAPERLESS_SESSION_COOKIE_SECURE = false;
        PAPERLESS_CSRF_TRUSTED_ORIGINS = "http://192.168.0.8:28981";

        # admin creates accounts manually
        PAPERLESS_ACCOUNT_ALLOW_SIGNUPS = false;
        PAPERLESS_SOCIALACCOUNT_ALLOW_SIGNUPS = false;
      };

      port = 28981;
    };

    networking.firewall.allowedTCPPorts = [ 28981 ];
  };
}
