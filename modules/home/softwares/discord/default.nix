{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.vesktop;
  inherit (lib) mkEnableOption mkIf;
in {
  options.programs.vesktop = {
    enable = mkEnableOption "Enable vesktop discord client";
  };

  config = mkIf cfg.enable {
    home.packages = [pkgs.vesktop];
  };
}
