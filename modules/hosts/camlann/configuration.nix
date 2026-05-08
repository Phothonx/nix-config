{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.camlannConfiguration = {pkgs, ...}: {
    imports = [
      self.nixosModules.camlannHardware

      self.nixosModules.impermanence

      self.diskoConfigurations.camlann
      inputs.disko.nixosModules.disko

      self.nixosModules.nix
      self.nixosModules.power
      self.nixosModules.nh
      self.nixosModules.desktop
      self.nixosModules.gaming
      self.nixosModules.obs

      self.nixosModules.nico
    ];

    environment.systemPackages = with pkgs; [
      mission-planner
      kdePackages.kdenlive
      evemu
      vlc
      loupe
      imv
      bitwarden-desktop
      spotify
      localsend
      proton-vpn
      teamspeak6-client
      ungoogled-chromium
      vesktop
      pavucontrol
      crosspipe
      wl-clipboard
      via
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
      hostName = "camlann";
      networkmanager.enable = true;
    };

    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "Europe/Paris";

    hardware = {
      nvidia.open = true;
      nvidia.modesetting.enable = true;
      nvidia.prime.offload.enable = true;

      enableAllFirmware = true;

      bluetooth.enable = true;
      bluetooth.powerOnBoot = false;

      graphics.enable = true;
      graphics.enable32Bit = true;
    };

    services.lact.enable = true;

    services.udev = {
      # mouse, keyboard, drone
      extraRules = ''
        KERNEL=="hidraw*", ATTRS{idVendor}=="3554", ATTRS{idProduct}=="f58c", MODE="0666", TAG+="uaccess"
        KERNEL=="hidraw*", ATTRS{idVendor}=="3554", ATTRS{idProduct}=="f58a", MODE="0666", TAG+="uaccess"

        KERNEL=="hidraw*", ATTRS{idVendor}=="2109", ATTRS{idProduct}=="0817", MODE="0666", TAG+="uaccess"
        KERNEL=="hidraw*", ATTRS{idVendor}=="2109", ATTRS{idProduct}=="2817", MODE="0666", TAG+="uaccess"
        KERNEL=="hidraw*", ATTRS{idVendor}=="2109", ATTRS{idProduct}=="0102", MODE="0666", TAG+="uaccess"
        KERNEL=="hidraw*", ATTRS{idVendor}=="fffe", ATTRS{idProduct}=="0015", MODE="0666", TAG+="uaccess"

        KERNEL=="hidraw*", ATTRS{idVendor}=="3185", ATTRS{idProduct}=="0038", MODE="0666", TAG+="uaccess"
        KERNEL=="hidraw*", ATTRS{idVendor}=="3162", ATTRS{idProduct}=="0053", MODE="0666", TAG+="uaccess"
        KERNEL=="hidraw*", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6015", MODE="0666", TAG+="uaccess"
      '';
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
      requires = [ "dev-disk-by\\x2did-nvme\\x2dCT500P1SSD8_1913E1F56204.device" ];
      after = [ "dev-disk-by\\x2did-nvme\\x2dCT500P1SSD8_1913E1F56204.device" ];
      before = ["sysroot.mount"];
      unitConfig.DefaultDependencies = "no";
      serviceConfig.Type = "oneshot";

      script = ''
        mkdir -p /btrfs_tmp
        mount -t btrfs -o subvolid=5 /dev/disk/by-id/nvme-CT500P1SSD8_1913E1F56204-part2 /btrfs_tmp

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
