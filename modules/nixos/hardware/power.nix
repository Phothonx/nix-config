{ lib, config, ... }:
with lib;
let
  cfg = config.system.power;
in
{
  options.hardware.power = {
    enable = mkEnableOption "Laptop Power saving settings";
  };

  config = {
    powerManagement.powertop.enable = true;

    services.thermald.enable = true;

    services.auto-cpufreq.enable = true;
    services.auto-cpufreq.settings = {
      battery = {
         governor = "powersave";
         turbo = "never";
      };
      charger = {
         governor = "performance";
         turbo = "auto";
      };
    };
  };
}
