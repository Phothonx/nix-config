{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.fontsProfiles;

  mkFontOption = name: pkg: {
    name = lib.mkOption {
      type = lib.types.str;
      default = name;
      example = "Fira Code";
    };
    package = lib.mkOption {
      type = lib.types.package;
      default = pkg;
      example = "pkgs.fira-code";
    };
  };

  mkSizeOption = size:
    lib.mkOption {
      type = lib.types.int;
      default = size;
      description = "Size in pixels for font profile";
      example = "14";
    };
in {
  options.fontsProfiles = {
    enable = lib.mkEnableOption "Whether to enable font profiles";

    monospace = mkFontOption "jetbrains-mono Nerd Font" pkgs.nerd-fonts.jetbrains-mono;
    regular = mkFontOption "ubuntu Nerd Font" pkgs.nerd-fonts.ubuntu;

    sizes = {
      desktop = mkSizeOption 22;
      applications = mkSizeOption 12;
      termianl = mkSizeOption 9;
    };
  };

  config = lib.mkIf cfg.enable {
    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [cfg.monospace.name];
      };
    };

    home.packages = [
      cfg.monospace.package
      cfg.regular.package
    ];
  };
}
