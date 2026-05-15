{
  flake.nixosModules.adguard = {

    systemd.tmpfiles.rules = [
      "d /data/adguard 0750 adguard adguard -"
    ];

    services.adguardhome = {
      enable = true; # 3000 (web interface) 34 (dns)
      mutableSettings = false;
      extraArgs = ["-w" "/data/adguard"];

      settings = {
        os.group = "adguard";
        os.user = "adguard";

        users = [
          {
            name = "admin";
            password = "$2y$10$A5BDrQNHFaLtzvvn4l2Sde/ZycKM25NMyy5npchg93k4fTGyjOX7W";
          }
        ];

        dns = {
          bind_hosts = [ "0.0.0.0" ];
          port = 53;

          upstream_dns = [
            "https://dns.quad9.net/dns-query"
          ];
          bootstrap_dns = [
            "9.9.9.9"
            "1.1.1.1"
          ];
          fallback_dns = [
            "https://cloudflare-dns.com/dns-query"
          ];
          rewrites = [
            { domain = "*.camlann.local"; answer = "192.168.0.8"; }
          ];

          cache_size = 4194304; # 4MB
          cache_ttl_min = 300;
          cache_optimistic = true;

          anonymize_client_ip = false;
          ratelimit = 0;
          upstream_timeout = "10s";
        };

        filtering = {
          protection_enabled = true;
          filtering_enabled = true;
          parental_enabled = false;
        };

        filters = [
          {
            enabled = true;
            url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/adblock/pro.txt";
            name = "HaGeZi DNS Blocklist - pro";
            id = 1;
          }
        ];

        statistics = {
          enabled = true;
          interval = "168h"; # keep 7 days of stats
        };

        log = {
          enabled = true;
          file = ""; # stdout
          max_backups = 3;
          max_size = 100;
          max_age = 3;
          compress = false;
          verbose = false;
        };
      };
    };

    networking.firewall.allowedTCPPorts = [53];
    networking.firewall.allowedUDPPorts = [53];
  };
}
