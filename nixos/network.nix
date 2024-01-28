{ pkgs, ... }: 
{
  networking = {
    hostName = "avalon";
    networkmanager.enable = true;
  };
}
