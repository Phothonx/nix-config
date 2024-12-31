{
  config,
  lib,
  ...
}:
let
  cfg = config.game;
  inherit (lib) mkEnableOption;
in
{
  options.game = {
    steam.enable = mkEnableOption "enable steam";
  };
}
