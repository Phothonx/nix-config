{ pkgs, ... }:
{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 2;
    };

    kernelParams = [
      "quiet"
      "splash"
      "loglevel=3"
      ];

#    initrd.systemd.enable = true;
#
#    plymouth = {
#      enable = true;
#      theme = "breeze";
#    };
  };
}