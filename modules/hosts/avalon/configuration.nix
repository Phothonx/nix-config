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
      self.nixosModules.printing

      self.nixosModules.nico

      self.nixosModules.syncthing
      self.nixosModules.vault
    ];

    age.secrets.jnms-wg.file = ../../../secrets/net/jnms-wg.age;
    networking.wg-quick.interfaces.jnms = {
      configFile = config.age.secrets.jnms-wg.path;
      autostart = true;
    };

    services.thermald.enable = true;

    environment.systemPackages = with pkgs; [
      mission-planner
      proton-vpn
      wireguard-tools
      phoronix-test-suite
      jellyfin-desktop
      parsec-bin
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

    persist.rollback = {
      device = "/dev/mapper/cryptroot";
      after = ["systemd-cryptsetup@cryptroot.service"];
    };

    virtualisation.spiceUSBRedirection.enable = true;
    virtualisation.libvirtd.qemu.swtpm.enable = true;
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
    persist.directories = [
      "/var/lib/qemu"
      "/var/lib/libvirt"
      "/var/lib/machines"
      "/var/lib/systemd"
    ];

    # === DO NOT TOUCH ! ===
    system.stateVersion = "25.11";
  };
}
