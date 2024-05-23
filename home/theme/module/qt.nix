{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.artwork;
in
{
  options.artwork.qt = {
    name = mkOption {
      type = types.str;
      default = "";
    };
    package = mkOption {
      type = types.package;
      default = pkgs.catppuccin-qt5ct;
    };
  };
  
  config = {
    home.sessionVariables = {
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_QPA_PLATFORMTHEME = "gtk2";
      DISABLE_QT5_COMPAT = "0";
    };

    qt = {
      enable = true;
      platformTheme = "gtk";
      style = cfg.qt;
    };
  };
}
