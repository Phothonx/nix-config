{inputs, ...}: {
  flake.nixosModules.impermanence = {
    config,
    lib,
    ...
  }: {
    imports = [
      inputs.impermanence.nixosModules.impermanence
    ];

    options.persist = {
      user.name = lib.mkOption {
        type = lib.types.str;
        default = "";
        description = "Main user username";
      };
      user.directories = lib.mkOption {
        type = lib.types.listOf lib.types.anything;
        default = [];
        description = "Main user's persistent directories";
      };
      user.files = lib.mkOption {
        type = lib.types.listOf lib.types.anything;
        default = [];
        description = "Main user's persistent files";
      };
      directories = lib.mkOption {
        type = lib.types.listOf lib.types.anything;
        default = [];
        description = "System persistent directories";
      };
      files = lib.mkOption {
        type = lib.types.listOf lib.types.anything;
        default = [];
        description = "System persistent files";
      };
    };

    config = {
      environment.persistence."/persist" = {
        enable = true;
        hideMounts = true;
        directories =
          [
            "/etc/nixos"
            "/var/log"
            "/var/lib/bluetooth"
            "/var/lib/nixos"
            "/var/lib/systemd/coredump"
            "/etc/ssh"
          ]
          ++ config.persist.directories
          ++ lib.optionals config.networking.networkmanager.enable [
            "/etc/NetworkManager/system-connections"
            "/var/lib/NetworkManager"
          ];
        files =
          [
            "/etc/machine-id"
          ]
          ++ config.persist.files;

        users = lib.mkIf (config.persist.user.name != "") {
          "${config.persist.user.name}" = {
            directories =
              [
                "Downloads"
                "Music"
                "Games"
                "Dev"
                "Desktop"
                "Pictures"
                "Documents"
                "Videos"
                "nix-config"
                {
                  directory = ".ssh";
                  mode = "0700";
                }
              ]
              ++ config.persist.user.directories;

            files = config.persist.user.files;
          };
        };
      };

      fileSystems."/persist".neededForBoot = true;
    };
  };
}
