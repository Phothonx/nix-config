{ systemConfig, userConfig, ... }: 
{
  services.xserver = {
    enable = true;
    layout = systemConfig.layout;
    displayManager.autoLogin = {
      enable = true;
      user = userConfig.userName;
    };
  };
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}