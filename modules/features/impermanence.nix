{inputs, ...}: {
  flake.nixosModules.impermanence = {
    config,
    lib,
    pkgs,
    ...
  }: {
    imports = [
      inputs.impermanence.nixosModules.impermanence
    ];

    options.persist = {
      rollback = {
        device = lib.mkOption {
          type = lib.types.str;
          description = "Device holding the btrfs root (subvolid=5) wiped on every boot. Empty disables the rollback.";
          default = "";
        };
        after = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
          description = "Units the rollback service must run after (e.g. the cryptsetup or device unit).";
        };
        requires = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
          description = "Units the rollback service requires.";
        };
      };

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

      boot.initrd.systemd.enable = true;
      boot.initrd.systemd.packages = with pkgs; [
        btrfs-progs
        coreutils
        findutils
        gnused
      ];
      boot.initrd.systemd.services.rollback-root = lib.mkIf (config.persist.rollback.device != "") {
        description = "Rollback Btrfs root";
        wantedBy = ["initrd.target"];
        after = config.persist.rollback.after;
        requires = config.persist.rollback.requires;
        before = ["sysroot.mount"];
        unitConfig.DefaultDependencies = "no";
        serviceConfig.Type = "oneshot";

        script = ''
          mkdir -p /btrfs_tmp
          mount -t btrfs -o subvolid=5 ${config.persist.rollback.device} /btrfs_tmp

          if [ -e /btrfs_tmp/root ]; then
            mkdir -p /btrfs_tmp/old_roots
            timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%d_%H:%M:%S")
            mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
          fi

          delete_subvolume_recursively() {
            IFS=$'\n'
            for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
              delete_subvolume_recursively "/btrfs_tmp/$i"
            done
            btrfs subvolume delete "$1"
          }

          if [ -d /btrfs_tmp/old_roots ]; then
            for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
              delete_subvolume_recursively "$i"
            done
          fi

          btrfs subvolume create /btrfs_tmp/root
          umount /btrfs_tmp
        '';
      };
    };
  };
}
