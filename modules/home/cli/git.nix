{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.programs.git;
in {
  config = mkIf cfg.enable {
    programs.git = {
      userName = "Phothonx";
      userEmail = "86020708+Phothonx@users.noreply.github.com";
    };
  };
}
