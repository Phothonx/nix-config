{
  flake.nixosModules.linkwarden = {config, ...}: {
    # NEXTAUTH_SECRET (and any other env secrets) live here:
    #   cd secrets && agenix -e linkwarden-env.age
    # File contents, e.g.:
    #   NEXTAUTH_SECRET=<openssl rand -base64 32>
    age.secrets.linkwarden-env = {
      file = ../../secrets/linkwarden-env.age;
      owner = "linkwarden";
    };

    services.linkwarden = {
      enable = true; # 3001 (3000 is taken by adguard)
      port = 3001;
      host = "127.0.0.1";

      # local postgres, created automatically (shares the cluster with immich)
      database.createLocally = true;

      environmentFile = config.age.secrets.linkwarden-env.path;

      environment = {
        NEXTAUTH_URL = "https://linkwarden.camlann.local/api/v1/auth";
      };
    };

    persist.directories = [
      "/var/lib/linkwarden"
    ];
  };
}
