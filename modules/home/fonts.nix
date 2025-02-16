{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.fontsProfiles;

  mkFontOption = name: package: {
    name = lib.mkOption {
      type = lib.types.str;
      default = name;
      example = "Fira Code";
    };
    package = lib.mkOption {
      type = lib.types.package;
      default = package;
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
  # iosevka, jetbrains, fira, victor

  options.fontsProfiles = {
    enable = lib.mkEnableOption "Whether to enable font profiles";

    monospace = mkFontOption "JetBrains Mono" pkgs.jetbrains-mono;
    regular = mkFontOption "Ubuntu" pkgs.ubuntu-classic;
    glyph = mkFontOption "Symbols Nerd Font Mono" pkgs.nerd-fonts.symbols-only;
    emoji = mkFontOption "Noto Color Emoji" pkgs.noto-fonts-color-emoji;

    sizes = {
      desktop = mkSizeOption 22;
      applications = mkSizeOption 12;
      termianl = mkSizeOption 12;
    };
  };

  config = lib.mkIf cfg.enable {
    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ cfg.monospace.name ];
        emoji = [ cfg.emoji.name ];
      };
    };

    home.packages = [
      cfg.monospace.package
      cfg.regular.package
      cfg.glyph.package
      cfg.emoji.package
    ];
  };
}
