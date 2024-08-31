{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.services.clipboard;
in
{
  options.services.clipboard = {
    enable = mkEnableOption "Enable wl-clipboard & cliphist";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.wl-clipboard ];
    services.cliphist.enable = true;
  };
}
