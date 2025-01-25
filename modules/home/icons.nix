{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.icons;
in {
  options.icons = {
    name = lib.mkOption {
      type = lib.types.str;
      default = "Morewaita";
      example = "Morewaita";
    };
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.morewaita-icon-theme;
      example = "pkgs.morewaita-icon-theme";
    };
  };

  config = {
    home.packages = [
      cfg.package
    ];
  };
}
