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
      default = "Papirus-Dark";
      example = "Papirus-Dark";
    };
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.papirus-icon-theme;
      example = "pkgs.papirus-icon-theme";
    };
  };

  config = {
    home.packages = [
      cfg.package
    ];
  };
}
