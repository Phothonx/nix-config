{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.programs.zoxide;
in {
  config = mkIf cfg.enable {
    programs.zoxide = {
      enableBashIntegration = true;
      enableFishIntegration = true;

      options = [
        "--cmd cd"
      ];
    };
  };
}
