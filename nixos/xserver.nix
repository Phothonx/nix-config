{ systemConfig, pkgs, ... }: 
{
  services.xserver = {
    enable = true;
    xkb.layout = systemConfig.layout;
    
    excludePackages = [ pkgs.xterm ];
    desktopManager.xterm.enable = false;
  };
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}