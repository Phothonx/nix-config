{inputs, ...}: {
  flake.nixosModules.meglingbot = {
    config,
    pkgs,
    ...
  }: {
    age.secrets.meglingbot-env.file = ../../secrets/selfhosted/meglingbot-env.age;

    # Dedicated service account so its state dir survives the impermanence
    # rollback with a stable owner (unlike DynamicUser + /var/lib/private).
    users.users.meglingbot = {
      isSystemUser = true;
      group = "meglingbot";
      home = "/var/lib/meglingbot";
    };
    users.groups.meglingbot = {};

    systemd.services.meglingbot = {
      description = "MeglingBot Discord bot";
      wantedBy = ["multi-user.target"];
      after = ["network-online.target"];
      wants = ["network-online.target"];

      serviceConfig = {
        ExecStart = "${inputs.meglingbot.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/meglingbot";
        # DISCORD_TOKEN lives here (agenix); read by root before dropping privileges.
        EnvironmentFile = config.age.secrets.meglingbot-env.path;

        User = "meglingbot";
        Group = "meglingbot";
        # db/ and logs/ are created relative to the working directory.
        StateDirectory = "meglingbot";
        WorkingDirectory = "/var/lib/meglingbot";

        Restart = "on-failure";
        RestartSec = 10;

        # Hardening.
        ProtectSystem = "strict";
        ProtectHome = true;
        PrivateTmp = true;
        NoNewPrivileges = true;
      };
    };

    persist.directories = [
      "/var/lib/meglingbot"
    ];
  };
}
