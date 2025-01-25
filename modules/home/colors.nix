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
      default = with cfg.base24; {
        background = base00;
        black = base01;
        b_black = base02;
        grey = base03;
        l_grey = base04;
        foreground = base05;
        white = base06;
        b_white = base07;
        red = base08;
        orange = base09;
        yellow = base0A;
        green = base0B;
        cyan = base0C;
        blue = base0D;
        purple = base0E;
        brown = base0F;
        d_background = base10;
        dt_background = base11;
        b_red = base12;
        b_yellow = base13;
        b_green = base14;
        b_cyan = base15;
        b_blue = base16;
        b_purple = base17;
     };
    };
  };
}
