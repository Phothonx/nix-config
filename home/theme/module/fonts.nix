{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.artwork;

  fontType = types.submodule {
    options = {
      package = mkOption { type = types.package; };
      name = mkOption { type = types.str; };
    };
  };
in
{
  options.artwork.fonts = {
    serif = mkOption {
      type = fontType;
      default = {
        package = (pkgs.nerdfonts.override { fonts = [ "Ubuntu" ]; });
        name = "Ubuntu Nerd Font";
      };
    };

    sansSerif = mkOption {
      type = fontType;
      default = {
        package = (pkgs.nerdfonts.override { fonts = [ "Ubuntu" ]; });
        name = "Ubuntu Nerd Font";
      };
    };

    monospace = mkOption {
      type = fontType;
      default = {
        package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
        name = "JetBrainsMono Nerd Font";
      };
    };

    emoji = mkOption {
      type = fontType;
      default = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };

    sizes = {
      desktop = mkOption {
        type = types.ints.unsigned;
        default = 22;
      };

      applications = mkOption {
        type = types.ints.unsigned;
        default = 12;
      };

      terminal = mkOption {
        type = types.ints.unsigned;
        default = 9;
      };
    };
  };

  config = {
    home.packages = [
      cfg.monospace.package
      cfg.serif.package
      cfg.sansSerif.package
      cfg.emoji.package
    ];
    fonts.fontconfig.enable = true;
  };
}
