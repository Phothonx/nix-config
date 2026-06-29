{
  flake.nixosModules.linkwarden = {config, ...}: {
    age.secrets.linkwarden-env = {
      file = ../../secrets/linkwarden-env.age;
      owner = "linkwarden";
    };

    services.linkwarden = {
      enable = true; # 3001 (3000 is taken by adguard)
      port = 3001;
      host = "127.0.0.1";
      # enableRegistration = true;

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
