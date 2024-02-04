{ pkgs, ... }:
{
  boot = {
    kernelPackages =  pkgs.linuxPackages_latest;

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 2;
    };

    consoleLogLevel = 0;

    kernelParams = [
      "quiet"

      "rd.systemd.show_status=auto"
      "rd.udev.log_level=3"
      "vt.global_cursor_default=0"
      ];

  };
}