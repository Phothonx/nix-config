{ systemConfig, ... }: 
{
  networking = {
    hostName = systemConfig.hostName;
    networkmanager.enable = true;
  };
}
