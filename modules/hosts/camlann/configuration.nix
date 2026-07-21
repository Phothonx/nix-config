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
      self.nixosModules.udev
      self.nixosModules.nvidia

      self.nixosModules.nico

      self.nixosModules.harden
      self.nixosModules.openssh
      self.nixosModules.immich
      self.nixosModules.syncthing
      self.nixosModules.vault
      self.nixosModules.homepage
      self.nixosModules.caddy
      self.nixosModules.adguard
      self.nixosModules.jellyfin
      self.nixosModules.navidrome
      self.nixosModules.qbittorrent
      self.nixosModules.starr
      self.nixosModules.beets
      self.nixosModules.gitea
      self.nixosModules.vaultwarden
      self.nixosModules.meglingbot
    ];

    environment.systemPackages = with pkgs; [
      mission-planner
      # kdePackages.kdenlive
      phoronix-test-suite
    ];

    users.users.nico.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO/j7aoPG6YiK6UInYCir/+L3h73O2V36M4M6PdsdREX"
    ];

    boot = {
      kernelParams = ["elevator=mq-deadline"];

      initrd.availableKernelModules = ["hid_cherry" "btrfs"];
      supportedFilesystems = ["btrfs"];

      tmp.cleanOnBoot = true;
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
    };

    networking.hostName = "camlann";
    networking.interfaces.wlp5s0.useDHCP = false;
    networking.interfaces.enp7s0 = {
      useDHCP = false;
      ipv4.addresses = [
        {
          address = "192.168.0.8";
          prefixLength = 24;
        }
      ];
    };
    networking.defaultGateway = "192.168.0.254";

    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "Europe/Paris";

    hardware = {
      enableAllFirmware = true;

      bluetooth.enable = true;
      bluetooth.powerOnBoot = false;
    };

    persist.rollback = {
      device = "/dev/disk/by-id/nvme-CT500P1SSD8_1913E1F56204-part2";
      after = ["dev-disk-by\\x2did-nvme\\x2dCT500P1SSD8_1913E1F56204.device"];
      requires = ["dev-disk-by\\x2did-nvme\\x2dCT500P1SSD8_1913E1F56204.device"];
    };

    # === DO NOT TOUCH ! ===
    system.stateVersion = "25.11";
  };
}
