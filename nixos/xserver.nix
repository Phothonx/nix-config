{ pkgs, ... }: 
{
  services.xserver = {
    enable = true;
    layout = "fr";
  };
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}