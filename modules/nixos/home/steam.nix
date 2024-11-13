{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.home-manager.users.${config.user.name}.game.steam;
in {
  config = mkIf cfg.enable {
    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;
    programs.gamemode.enable = true;
  };
}
