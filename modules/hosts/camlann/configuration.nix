{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.camlannConfiguration = {
    pkgs,
    config,
    ...
  }: {
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
      self.nixosModules.udev
      self.nixosModules.apps

      self.nixosModules.nico

      self.nixosModules.openssh
      self.nixosModules.immich
      self.nixosModules.paperless
      self.nixosModules.homepage
      self.nixosModules.caddy
      self.nixosModules.adguard
      self.nixosModules.jellyfin
      self.nixosModules.qbittorrent
    ];

    environment.systemPackages = with pkgs; [
      mission-planner
      # kdePackages.kdenlive
      phoronix-test-suite

      # nvtopPackages.nvidia # nvtop
      # cudaPackages.cudatoolkit
      nvidia-vaapi-driver # Ajoute le driver VA-API pour le décodage vidéo
      vdpauinfo # Outil pour tester VDPAU
      libva-utils # Outils pour tester VA-API
    ];
users.users.nico.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO/j7aoPG6YiK6UInYCir/+L3h73O2V36M4M6PdsdREX"
    ];

    environment.sessionVariables = {
      # accélération vidéo matérielle via nvidia-vaapi-driver
      NVD_BACKEND = "direct";
      # forcer l'utilisation de la librairie d'accélération matérielle
      # LIBVA_DRIVER_NAME = "nvidia";
    };

    services.xserver.videoDrivers = ["nvidia"];
    boot = {
      blacklistedKernelModules = ["nouveau" "nvidiafb" "rivafb"];
      extraModprobeConfig = ''
        options nvidia-drm modeset=1
        options nvidia NVreg_UsePageAttributeTable=1
        options nvidia NVreg_EnablePCIeGen3=1
      '';
      initrd.kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
      kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
      kernelParams = [
        "nvidia-drm.modeset=1"
        "nvidia-drm.fbdev=1"
        "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
      ];

      initrd.availableKernelModules = ["hid_cherry" "btrfs"];
      supportedFilesystems = ["btrfs"];

      tmp.cleanOnBoot = true;
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
    };

    networking = {
      hosts."192.168.0.8" = [
        "immich.camlann"
        "homepage.camlann"
        "paperless.camlann"
        "kuma.camlann"
        "adguard.camlann"
      ];

      hostName = "camlann";
      networkmanager.enable = true;
    };

    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "Europe/Paris";

    systemd.services = {
      "nvidia-suspend".enable = true;
      "nvidia-resume".enable = true;
      "nvidia-hibernate".enable = true;
    };

    hardware = {
      nvidia-container-toolkit.enable = true;
      nvidia = {
        open = false; # proprietary drivers
        modesetting.enable = true;
        powerManagement.enable = true;
        powerManagement.finegrained = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.production;
      };

      enableAllFirmware = true;

      bluetooth.enable = true;
      bluetooth.powerOnBoot = false;

      graphics.enable = true;
      graphics.enable32Bit = true;
      graphics.extraPackages = with pkgs; [
        libva-vdpau-driver # Pont VA-API → VDPAU
        libvdpau-va-gl # Accélération VDPAU OpenGL
      ];
    };

    services.lact.enable = true;

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
      requires = ["dev-disk-by\\x2did-nvme\\x2dCT500P1SSD8_1913E1F56204.device"];
      after = ["dev-disk-by\\x2did-nvme\\x2dCT500P1SSD8_1913E1F56204.device"];
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
