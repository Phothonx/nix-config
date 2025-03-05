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
      default = with cfg.palette; rec {
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

    palette = mkOption { # https://github.com/tinted-theming/base24/blob/main/styling.md

      type = types.attrsOf hexColorCode;
      default = rec {
        background = black; # default background
        accent     = red;
        secondary  = yellow;

        black      = "11111b"; # ---- dark
        b_black    = "1e1e2e"; # ---
        d_grey     = "313244"; # --
        grey       = "6c7086"; # -
        b_grey     = "a6adc8"; # +
        foreground = "cdd6f4"; # ++
        white      = "cdd6f4"; # +++
        b_white    = "ffffff"; # ++++ light

        red        = "f38ba8";
        orange     = "fab387";
        yellow     = "f9e2af";
        green      = "a6e3a1";
        cyan       = "89dceb";
        blue       = "89b4fa";
        purple     = "cba6f7";
        brown      = "eba0ac";

        b_red      = "f5c2e7";
        b_yellow   = "f5e0dc";
        b_green    = "94e2d5";
        b_cyan     = "89dceb";
        b_blue     = "74c7ec";
        b_purple   = "b4befe";
      };
    };
  };
}
