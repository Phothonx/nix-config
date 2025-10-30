{inputs, pkgs, config, ...}: {
  imports = with inputs.nixos-hardware.nixosModules; [
    # ./hardware-configuration.nix
    raspberry-pi-3

    ./../common/global/nix.nix
    ./../common/users/guest
  ];


  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi3;
    initrd.availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };

  networking = {
    hostName = "crystal";
    wireless = {
      enable = true;
      secretsFile = config.sops.secrets.wifi_configs.path;
      networks."jnms".psk = "ext:psk_jnms";
      interfaces = [ "wlu1u2" ];
    };
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ "guest" ];
    };
  };

  environment.systemPackages = with pkgs; [ vim ];

  hardware.deviceTree.enable = true;
  hardware.enableRedistributableFirmware = true;

  nixpkgs.hostPlatform = "aarch64-linux";
  nixpkgs.config.allowUnsupportedSystem = true;

  # === DO NOT TOUCH ! ===
  system.stateVersion = "23.11";
}
