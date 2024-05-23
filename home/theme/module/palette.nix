{ config, lib, ... }:
with lib;
let
  cfg = config.artwork;
in
{
  options.artwork.palette = {
    accent = mkOption {
      type = types.ints.str;
      description = "accent color";
      default = "000000";
    };
    base00 = mkOption {
      type = types.ints.str;
      description = "background";
      default = "000000";
    };
    base01 = mkOption {
      type = types.ints.str;
      description = "black";
      default = "000000";
    };
    base02 = mkOption {
      type = types.ints.str;
      description = "bright black";
      default = "000000";
    };
    base03 = mkOption {
      type = types.ints.str;
      description = "grey";
      default = "000000";
    };
    base04 = mkOption {
      type = types.ints.str;
      description = "light grey";
      default = "000000";
    };
    base05 = mkOption {
      type = types.ints.str;
      description = "foreground";
      default = "000000";
    };
    base06 = mkOption {
      type = types.ints.str;
      description = "white";
      default = "000000";
    };
    base07 = mkOption {
      type = types.ints.str;
      description = "bright white";
      default = "000000";
    };
    base08 = mkOption {
      type = types.ints.str;
      description = "red";
      default = "000000";
    };
    base09 = mkOption {
      type = types.ints.str;
      description = "yellow";
      default = "000000";
    };
    base0A = mkOption {
      type = types.ints.str;
      description = "bright yellow";
      default = "000000";
    };
    base0B = mkOption {
      type = types.ints.str;
      description = "green";
      default = "000000";
    };
    base0C = mkOption {
      type = types.ints.str;
      description = "cyan";
      default = "000000";
    };
    base0D = mkOption {
      type = types.ints.str;
      description = "blue";
      default = "000000";
    };
    base0E = mkOption {
      type = types.ints.str;
      description = "purple";
      default = "000000";
    };
    base0F = mkOption {
      type = types.ints.str;
      description = "dark red/brown";
      default = "000000";
    };
    base10 = mkOption {
      type = types.ints.str;
      description = "darker black";
      default = "000000";
    };
    base11 = mkOption {
      type = types.ints.str;
      description = " darkest black";
      default = "000000";
    };
    base12 = mkOption {
      type = types.ints.str;
      description = "bright red";
      default = "000000";
    };
    base13 = mkOption {
      type = types.ints.str;
      description = "bright yellow";
      default = "000000";
    };
    base14 = mkOption {
      type = types.ints.str;
      description = "bright green";
      default = "000000";
    };
    base15 = mkOption {
      type = types.ints.str;
      description = "bright cyan";
      default = "000000";
    };
    base16 = mkOption {
      type = types.ints.str;
      description = "bright blue";
      default = "000000";
    };
    base17 = mkOption {
      type = types.ints.str;
      description = "bright purple";
      default = "000000";
    };
  };
}
