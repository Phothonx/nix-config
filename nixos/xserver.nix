{ systemConfig, ... }: 
{
  services.xserver = {
    enable = true;
    layout = systemConfig.layout;
  };
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}