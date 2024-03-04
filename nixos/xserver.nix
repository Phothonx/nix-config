{ systemConfig, userConfig, ... }: 
{
  services.xserver = {
    enable = true;
    xkb.layout = systemConfig.layout;
  };
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}