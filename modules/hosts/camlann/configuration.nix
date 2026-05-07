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
      # kdePackages.kdenlive
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
      initrd.availableKernelModules = ["hid_cherry"];

      tmp.cleanOnBoot = true;
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
    };

    networking = {
      hostName = "camlann";
      hostId = "8c262600"; # do not change
      networkmanager.enable = true;
    };

    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "Europe/Paris";

    hardware = {
      enableAllFirmware = true;

      bluetooth.enable = true;
      bluetooth.powerOnBoot = false;

      graphics.enable = true;
      graphics.enable32Bit = true;
    };

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

    services.zfs.autoScrub.enable = true;
    # services.zfs.autoSnapshot.enable = true; # to see with impermanence
    boot.supportedFilesystems = [ "zfs" ];
    boot.zfs.forceImportRoot = false;

    boot.initrd.systemd.enable = true;
    boot.initrd.systemd.services.rollback-root = {
      description = "Rollback ZFS root to blank snapshot";
      wantedBy = ["initrd.target"];
      after = ["zfs-import-zroot.service"];
      before = ["sysroot.mount"];

      unitConfig.DefaultDependencies = "no";

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };

      script = ''
        zfs rollback -r zroot/root@blank
      '';
    };

    # === DO NOT TOUCH ! ===
    system.stateVersion = "25.11";
  };
}
