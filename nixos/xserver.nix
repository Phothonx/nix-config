{ systemConfig, pkgs, ... }: 
{
  services.xserver = {
    enable = true;
    xkb.layout = systemConfig.layout;
  };
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";

  excludePackages = [ pkgs.xterm ];
  desktopManager.xterm.enable = false;
}