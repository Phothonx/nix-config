{ pkgs, lib, ... }:
with lib;
let
  cfg = config.artwork;
in
{
  options.artwork.cursor = {
    name = mkOption {
      type = types.str;
      default = "Bibata-Modern-Ice";
    };
    package = mkOption {
      type = types.package;
      default = pkgs.bibata-cursors;
    };
    size = mkOption {
      type = types.int;
      default = 22;
    };
  };

  config = {
    home = {
      pointerCursor = {
        inherit (cfg.cursor);
        x11.enable = true;
        gtk.enable = true;
      };

      packages = [ cfg.cursor.package ];

      sessionVariables = {
        XCURSOR_THEME = cfg.cursor.name;
        XCURSOR_SIZE = cfg.cursor.size;
        XCURSOR_PATH = "/usr/share/icons:${config.xdg.dataHome}/icons";
      };
    };
  };
}
