{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.cursor;
in {
  options.cursor = {
    name = lib.mkOption {
      type = lib.types.str;
      default = "Bibata-Modern-Ice";
      example = "Bibata-Modern-Ice";
    };
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.bibata-cursors;
      example = "pkgs.bibata-cursors";
    };
    size = lib.mkOption {
      type = lib.types.int;
      default = 22;
      description = "Size of the cursor";
      example = "22";
    };
  };

  config = {
    home = {
      packages = [
        cfg.package
      ];
      pointerCursor = {
        inherit (cfg) name package size;
        x11.enable = true;
        gtk.enable = true;
      };
      sessionVariables = {
        XCURSOR_THEME = cfg.name;
        XCURSOR_SIZE = cfg.size;
      };
    };
  };
}
