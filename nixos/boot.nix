{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    tmp.cleanOnBoot = true;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 2;
    };

    kernelParams = [
      "quiet"
      "consoleLogLevel=3"
      "rd.systemd.show_status=auto"
      "rd.udev.log_level=3"
      "vt.global_cursor_default=0"
      ];
  };
}
