{ config, lib, ... }:
with lib;
let
  cfg = config.programs.direnv;
in
{
  config.programs.direnv = mkIf cfg.enable {
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
}
