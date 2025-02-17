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
      default = with cfg.palette; {
        base00 = background;
        base01 = black;
        base02 = b_black;
        base03 = grey;
        base04 = b_grey;
        base05 = foreground;
        base06 = white;
        base07 = b_white;
        base08 = red;
        base09 = orange;
        base0A = yellow;
        base0B = green;
        base0C = cyan;
        base0D = blue;
        base0E = purple;
        base0F = brown;
        base10 = black; # same black
        base11 = black; # same black
        base12 = b_red;
        base13 = b_yellow;
        base14 = b_green;
        base15 = b_cyan;
        base16 = b_blue;
        base17 = b_purple;
      };
    };

    base16 = mkOption {
      type = types.attrsOf hexColorCode;
      default = with cfg.palette; {
        base00 = background;
        base01 = black;
        base02 = b_black;
        base03 = grey;
        base04 = b_grey;
        base05 = foreground;
        base06 = white;
        base07 = b_white;
        base08 = red;
        base09 = orange;
        base0A = yellow;
        base0B = green;
        base0C = cyan;
        base0D = blue;
        base0E = purple;
        base0F = brown;
      };
    };

    palette = mkOption { # https://github.com/tinted-theming/base24/blob/main/styling.md
      # one colorsheme to rule them all
      # mix from catpuccin rose pine, and a bit of salt

      type = types.attrsOf hexColorCode;
      default = rec {
        background = "11111b"; # default background
        foreground = "cdd6f4"; # foreground
        accent     = red;
        secondary  = yellow;

        dt_black   = ""; # darkest background (not used)
        d_black    = ""; # darker background (not used)
        black      = "000000";
        b_black    = "191724"; # selection background
        grey       = "6e6a86"; # comments
        b_grey     = "908caa"; # dark foreground
        white      = "e0def4"; # light foreground
        b_white    = "ffffff"; # lightest foreground

        red        = "eb6f92";
        b_red      = "f5c2e7";

        brown      = "eba0ac"; # dark red
        orange     = "fab387";

        yellow     = "f6c177";
        b_yellow   = "f9e2af";

        green      = "a6e3a1";
        b_green    = "94e2d5";

        cyan       = "31748f";
        b_cyan     = "93e1d4";

        blue       = "89b4fa";
        b_blue     = "74c7ec";

        purple     = "cba6f7";
        b_purple   = "b4befe";
      };
    };
  };
}
