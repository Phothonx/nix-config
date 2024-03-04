{ ... }:
{  
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.logind.extraConfig = ''
    HandlePowerKey=suspend
    HandlePowerKeyLongPress=hibernate
  '';

  services = {
    # for SSD/NVME
    fstrim.enable = true;
  };
}