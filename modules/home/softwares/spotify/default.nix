{
  config,
  lib,
  ...
}:
let
  inherit (lib) mkIf;
  cfg = config.programs.spotify-player;
in {
  config = mkIf cfg.enable {
    programs.spotify-player = {
    };
  };
}
