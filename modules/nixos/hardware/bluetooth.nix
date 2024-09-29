{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.hardware.bluetooth;
in {
  config = mkIf cfg.enable {
    hardware.bluetooth = {
      powerOnBoot = false;
    };
  };
}
