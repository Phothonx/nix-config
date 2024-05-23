{ config, pkgs, lib, ... }:
with lib;
let 
  cfg = config.artwork;
in
{
  options.artwork.icons = { 
    name = mkOption {
      type = types.str;
      default = "MoreWaita";
    };
    package = mkOption {
      type = types.package;
      default = pkgs.morewaita-icon-theme;
    };
  };

  config = {
    home.package = [
      cfg.icons.package
      pkgs.gnome.adwaita-icon-theme
    ];
  };
}
