{ systemConfig, ... }:
{
  networking = {
    hostName = systemConfig.hostName;
    networkmanager.enable = true;
  };
  # Don't wait for network startup
  systemd.services.NetworkManager-wait-online.enable = false;
}