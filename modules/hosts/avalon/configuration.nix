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
      # self.nixosModules.gaming
      self.nixosModules.obs
      self.nixosModules.udev
      self.nixosModules.apps
      self.nixosModules.printing

      self.nixosModules.nico

      self.nixosModules.harden
      self.nixosModules.maintenance
      self.nixosModules.syncthing
      self.nixosModules.vault
      self.nixosModules.albion
    ];

    age.secrets.jnms-wg.file = ../../../secrets/net/jnms-wg.age;
    networking.wg-quick.interfaces.jnms = {
      configFile = config.age.secrets.jnms-wg.path;
      autostart = true;
    };

    services.thermald.enable = true;
    zramSwap.enable = true;
    boot.kernel.sysctl = {
      "vm.swappiness" = 180;
      "vm.page-cluster" = 0;
    };

    # btrfs is mounted with discard=async already; the weekly trim is redundant
    services.fstrim.enable = false;

    environment.systemPackages = with pkgs; [
      mission-planner
      proton-vpn
      wireguard-tools
      phoronix-test-suite
      parsec-bin
      wakeonlan
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

      loader = {
        timeout = 1; # hold Space at boot to show the menu
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
    };

    # systemd-resolved: per-link DNS, so tailscale MagicDNS, the jnms VPN and
    # the LAN resolver coexist instead of fighting over /etc/resolv.conf
    services.resolved.enable = true;

    networking = {
      hostName = "avalon";
      networkmanager = {
        enable = true;
        dns = "systemd-resolved";
        ensureProfiles.profiles.ethernet-dhcp = {
          connection = {
            id = "ethernet-dhcp";
            type = "ethernet";
            autoconnect = true;
            autoconnect-priority = 100;
          };
          ipv4.method = "auto";
          ipv6.method = "auto";
        };
      };
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
          intel-media-driver # LIBVA_DRIVER_NAME=iHD (Alder Lake: i965 does not apply)
          libvdpau-va-gl # VDPAU apps on top of VA-API
        ];
        extraPackages32 = with pkgs; [
          pkgsi686Linux.intel-media-driver
        ];
      };
    };

    persist.rollback = {
      device = "/dev/mapper/cryptroot";
      after = ["systemd-cryptsetup@cryptroot.service"];
    };

    persist.directories = [
      "/var/lib/systemd" # timer stamps, backlight/rfkill state, random seed, ...
    ];

    # === DO NOT TOUCH ! ===
    system.stateVersion = "25.11";
  };
}
