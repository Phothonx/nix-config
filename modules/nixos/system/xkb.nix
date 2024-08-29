{ config, lib, ... }:
with lib;
let
  cfg = config.system.xkb;
in
{
  options.system.xkb = {
    enable = mkEnableOption "Enable xkb config";
  };

  config = mkIf cfg.enable {
    console.useXkbConfig = true;
    services.xserver.xkb = {
      layout = "fr";
      options = "caps:escape";
    };
  };
}
