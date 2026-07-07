# Seafile server (encrypted-library file storage) as an OCI-container stack.
# There is no `services.seafile` NixOS module in nixpkgs, so this runs the
# official images via podman: seafile-mc + MariaDB + memcached.
#
# Data lives under /data/seafile (the /data mount is already persistent, like
# immich/paperless), so nothing here needs a `persist.directories` entry.
#
# Secrets (create with agenix, see note at the bottom): the env file must define
#   MYSQL_ROOT_PASSWORD=<pw>
#   DB_ROOT_PASSWD=<same pw>
#   SEAFILE_ADMIN_EMAIL=<you@example.com>
#   SEAFILE_ADMIN_PASSWORD=<admin pw>
{
  flake.nixosModules.seafile = {
    config,
    pkgs,
    ...
  }: {
    age.secrets.seafile-env.file = ../../secrets/selfhosted/seafile-env.age;

    systemd.tmpfiles.rules = [
      "d /data/seafile 0750 root root -"
    ];

    # oci-containers only appends `--network` flags; it does not create the
    # network, and podman needs a user-defined network for name resolution
    # between the containers (db / memcached aliases below).
    systemd.services.init-seafile-network = {
      description = "Create the podman network for Seafile";
      wantedBy = ["multi-user.target"];
      after = ["network.target"];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };
      script = ''
        ${pkgs.podman}/bin/podman network exists seafile-net \
          || ${pkgs.podman}/bin/podman network create seafile-net
      '';
    };

    virtualisation.oci-containers.containers = {
      seafile-db = {
        image = "mariadb:10.11";
        networks = ["seafile-net"];
        extraOptions = ["--network-alias=db"];
        environment.MYSQL_LOG_CONSOLE = "true";
        # MYSQL_ROOT_PASSWORD comes from the secret.
        environmentFiles = [config.age.secrets.seafile-env.path];
        volumes = ["/data/seafile/db:/var/lib/mysql"];
        autoStart = true;
      };

      seafile-memcached = {
        image = "memcached:1.6";
        networks = ["seafile-net"];
        extraOptions = ["--network-alias=memcached"];
        entrypoint = "memcached";
        cmd = ["-m" "256"];
        autoStart = true;
      };

      seafile = {
        image = "seafileltd/seafile-mc:11.0-latest";
        networks = ["seafile-net"];
        dependsOn = ["seafile-db" "seafile-memcached"];
        ports = ["8083:80"]; # caddy terminates TLS and proxies here
        environment = {
          DB_HOST = "db";
          DB_PORT = "3306";
          TIME_ZONE = "Europe/Paris";
          SEAFILE_SERVER_LETSENCRYPT = "false";
          SEAFILE_SERVER_HOSTNAME = "seafile.camlann.local";
        };
        # DB_ROOT_PASSWD + SEAFILE_ADMIN_* come from the secret.
        environmentFiles = [config.age.secrets.seafile-env.path];
        volumes = ["/data/seafile/data:/shared"];
        autoStart = true;
      };
    };

    # Make the container units wait for the podman network to exist.
    systemd.services.podman-seafile = {
      after = ["init-seafile-network.service"];
      requires = ["init-seafile-network.service"];
    };
    systemd.services.podman-seafile-db = {
      after = ["init-seafile-network.service"];
      requires = ["init-seafile-network.service"];
    };
    systemd.services.podman-seafile-memcached = {
      after = ["init-seafile-network.service"];
      requires = ["init-seafile-network.service"];
    };
  };
}