{
  lib,
  config,
  ...
}: let
  cfg = config.colorScheme;
  inherit (lib) types mkOption;

  hexColorCode = types.strMatching "([0-9a-fA-F]{3}){1,2}";
in {
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

    palette = mkOption { # https://github.com/tinted-theming/base24/blob/main/styling.md
      # one colorsheme to rule them all
      # mix from ashen catpuccin rose pine, a bit of salt

      type = types.attrsOf hexColorCode;
      default = {
        background = "121212"; # default background
        foreground = "e5e5e5"; # foreground

        black = "121212";
        b_black = "151515"; # selection background

        grey = "a7a7a7"; # comments
        b_grey = "#535353"; # dark foreground

        white = "e5e5e5"; # light foreground
        b_white = "FFFFFF"; # lightest foreground

        red = "C53030";
        b_red = "DF6464";

        brown = "7A2E2E"; # dark red
        orange = "D87C4A";

        yellow = "D7A933";
        b_yellow = "F4CA64";

        green = "1E6F54";
        b_green = "629C7D";

        cyan = "6E91C4";
        b_cyan = "4AC4C4";

        blue = "233A71";
        b_blue = "4A8B8B";

        purple = "502E5F";
        b_purple = "7A3D82";

        accent = red;
        b_accent = yellow;

        # not used
        d_black = ""; # darker background
        dt_black = ""; # darkest background
      };
    };
  };
}
