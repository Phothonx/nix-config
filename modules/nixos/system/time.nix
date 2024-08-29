{ config, lib, ... }:
with lib;
let
  cfg = config.system.time;
in
{
  options.system.time = {
    enable = mkEnableOption "Enable time settings";
  };

  config = mkIf cfg.enable {
    time.timeZone = "Europe/Paris";
  };
}
