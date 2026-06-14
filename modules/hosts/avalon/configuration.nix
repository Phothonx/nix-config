{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.avalonConfiguration = {
    config,
    pkgs,
    ...
  }: {
    imports = [
      self.nixosModules.avalonHardware

      self.nixosModules.impermanence

      self.diskoConfigurations.avalon
      inputs.disko.nixosModules.disko

      self.nixosModules.nix
      self.nixosModules.power
      self.nixosModules.nh
      self.nixosModules.desktop
      self.nixosModules.gaming
      self.nixosModules.obs
      self.nixosModules.udev
      self.nixosModules.apps

      self.nixosModules.nico
    ];

    age.secrets.jnms-wg.file = ../../../secrets/jnms-wg.age;
    networking.wg-quick.interfaces.jnms = {
      configFile = config.age.secrets.jnms-wg.path;
      autostart = false;
    };

    services.thermald.enable = true;

    environment.systemPackages = with pkgs; [
      mission-planner
      proton-vpn
      wireguard-tools
      phoronix-test-suite
      jellyfin-desktop
    ];

    services.greetd = {
      enable = true;
      settings.default_session = {
        command = "${self.packages.${pkgs.stdenv.hostPlatform.system}.niri}/bin/niri-session";
        user = "nico";
      };
    };

    boot = {
      # to detect mouse & keybr at startup
      initrd.availableKernelModules = ["hid_cherry" "btrfs"];
      supportedFilesystems = ["btrfs"];

      tmp.cleanOnBoot = true;
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
    };

    networking = {
      hostName = "avalon";
      hosts = {
        "192.168.0.8" = ["homepage.camlann.local" "adguard.camlann.local"];
      };
      networkmanager.enable = true;
    };

    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "Europe/Paris";

    hardware = {
      enableAllFirmware = true;

      bluetooth.enable = true;
      bluetooth.powerOnBoot = false;

      graphics = {
        enable = true;
        enable32Bit = true; # critical for Steam/Proton
        extraPackages = with pkgs; [
          intel-media-driver # LIBVA_DRIVER_NAME=iHD
          intel-vaapi-driver
          libva-vdpau-driver
          libvdpau-va-gl
        ];
        extraPackages32 = with pkgs; [
          pkgs.pkgsi686Linux.intel-media-driver
          pkgs.pkgsi686Linux.intel-vaapi-driver
        ];
      };
    };

    boot.initrd.systemd.enable = true;
    boot.initrd.systemd.packages = with pkgs; [
      btrfs-progs
      coreutils
      findutils
      gnused
    ];
    boot.initrd.systemd.services.rollback-root = {
      description = "Rollback Btrfs root";
      wantedBy = ["initrd.target"];
      after = ["systemd-cryptsetup@cryptroot.service"];
      before = ["sysroot.mount"];
      unitConfig.DefaultDependencies = "no";

      serviceConfig.Type = "oneshot";

      script = ''
        mkdir -p /btrfs_tmp
        mount -o subvolid=5 /dev/mapper/cryptroot /btrfs_tmp

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

    # === DO NOT TOUCH ! ===
    system.stateVersion = "25.11";
  };
}
