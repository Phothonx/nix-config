{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.programs.eza;
in {
  config = mkIf cfg.enable {
    programs.eza = {
      enableBashIntegration = true;
      enableFishIntegration = true;

      extraOptions = [
        "--icons=always"
        "--git"
        "--group-directories-first"
        "--header"
      ];
    };
  };
}
