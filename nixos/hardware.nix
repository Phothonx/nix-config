{ ... }:
{  
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  services.logind.extraConfig = ''
    HandlePowerKey=suspend
    HandlePowerKeyLongPress=hibernate
    HandleLidSwitchExternalPower=ignore
  '';

  services = {
    # for SSD/NVME
    fstrim.enable = true;

    udisks2 = {
      enable = true;
      mountOnMedia = true;
    };
  };
}
