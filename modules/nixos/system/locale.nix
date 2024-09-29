{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.system.locale;
in {
  options.system.locale = {
    enable = mkEnableOption "Enable locale settings";
  };

  config = mkIf cfg.enable {
    i18n.defaultLocale = "en_US.UTF-8";
  };
}
