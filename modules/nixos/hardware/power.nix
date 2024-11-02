{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.hardware.power;
in {
  options.hardware.power = {
    enable = mkEnableOption "Laptop Power saving settings";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [powertop];

    powerManagement.enable = true;
    powerManagement.powertop.enable = true;

    services.thermald.enable = true;

    services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        # Change CPU energy/performance policy to power (default is balance_power)
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_power";

        # Enable the platform profile low-power
        PLATFORM_PROFILE_ON_AC = "balanced";
        PLATFORM_PROFILE_ON_BAT = "low-power";

        # Disable turbo boost:
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        CPU_HWP_DYN_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;

        # Enable runtime power management
        RUNTIME_PM_ON_AC = "auto";
        RUNTIME_PM_ON_BAT = "auto";

        # Enable Wi-Fi power save (default is off)
        WIFI_PWR_ON_AC = "on";
        WIFI_PWR_ON_BAT = "on";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 90;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 70;

        #Optional helps save long term battery health
        START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
        STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
      };
    };
  };
}
