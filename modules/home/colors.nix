{
  lib,
  config,
  ...
}:
let
  cfg = config.colorScheme;
  inherit (lib) types mkOption;

  hexColorCode = types.strMatching "([0-9a-fA-F]{3}){1,2}";
in
{
  options.colorScheme = {

    base24 = mkOption {
      type = types.attrsOf hexColorCode;
      default = {
        base00 = "1e1e2e"; # base
        base01 = "313244"; # surface 0
        base02 = "45475a"; # surface 1
        base03 = "585b70"; # surface 2
        base04 = "6c7086"; # overlay 0
        base05 = "7f849c"; # overlay 1
        base06 = "9399b2"; # overlay 2
        base07 = "cdd6f4"; # text
        base08 = "f38ba8"; # red
        base09 = "fab387"; # peach
        base0A = "f9e2af"; # yellow
        base0B = "a6e3a1"; # green
        base0C = "94e2d5"; # teal
        base0D = "89b4fa"; # blue
        base0E = "cba6f7"; # mauve
        base0F = "eba0ac"; # maroon
        base10 = "181825"; # mantle
        base11 = "11111b"; # crust
        base12 = "f5c2e7"; # pink
        base13 = "f5e0dc"; # rosewater
        base14 = "94e2d5"; # teal
        base15 = "89dceb"; # sky
        base16 = "74c7ec"; # sapphire
        base17 = "b4befe"; # lavender
      };
    };

    palette = mkOption {
      type = types.attrsOf hexColorCode;
#      default = with cfg.base24 {
#        accent = base0E;
#        laccent = base17;
#
#        bg0 = base11;
#        bg1 = base10;
#        bg2 = base00;
#
#        ele0 = base01;
#        ele1 = base02;
#        ele2 = base03;
#
#        select = base02;
#        text = base07;
#
#        # Normal colors
#        red = base08;
#        orange = base09;
#        yellow = base0A;
#        green = base0B;
#        cyan = base0C;
#        blue = base0D;
#        purple = base0E;
#        brown = base0F;
#
#        # Bright/light colors
#        lred = base12;
#        lyellow = base13;
#        lgreen = base14;
#        lcyan = base15;
#        lblue = base16;
#        lpurple = base17;
#      };
    };
  };
}
