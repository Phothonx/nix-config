{
  config,
  lib,
  pkgs,
  ...
}: 
let
  cfg = config.game;
  inherit (lib) mkIf mkEnableOption;
in
{
  options.game = {
    steam.enable = mkEnableOption "enable steam";
  };
}
