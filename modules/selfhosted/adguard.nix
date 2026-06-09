{
  flake.nixosModules.adguard = {

    services.adguardhome = {
      enable = true; # 3000 (web interface) 34 (dns)
      mutableSettings = false;

      settings = {
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
            "tls://dns.quad9.net"
          ];
          bootstrap_dns = [
            "9.9.9.9"
            "1.1.1.1"
          ];

          cache_size = 4194304; # 4MB
          cache_ttl_min = 300;
          cache_optimistic = true;

          anonymize_client_ip = false;
          ratelimit = 0;
          upstream_timeout = "10s";
          enable_dnssec = true;
        };

        filtering = {
          protection_enabled = true;
          filtering_enabled = true;
          parental_enabled = false;
          rewrites = [
            {
              domain = "*.camlann.local";
              answer = "192.168.0.8";
              enabled = true;
            }
          ];
        };

        filters = [
          {
            enabled = true;
            url = "https://adaway.org/hosts.txt";
            name = "AdAway default blocklist";
            id = 1;
          }
          {
            enabled = true;
            url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/adblock/pro.plus.txt";
            name = "HaGeZi's Pro++ DNS Blocklist";
            id = 2;
          }
          {
            enabled = true;
            url = "https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt";
            name = "AdGuard DNS filter";
            id = 3;
          }
          {
            enabled = true;
            url = "https://malware-filter.gitlab.io/malware-filter/phishing-filter-agh.txt";
            name = "Phishing URL Blocklist";
            id = 4;
          }
          {
            enabled = true;
            url = "https://raw.githubusercontent.com/TG-Twilight/AWAvenue-Ads-Rule/main/AWAvenue-Ads-Rule.txt";
            name = "AWAvenue Ads Rule";
            id = 5;
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

    persist.directories = [
      "/var/lib/private/AdGuardHome"
    ];
  };
}
