{ lib, ... }:
with lib;
let
  opcacityDef = mkOption {
    type = types.float;
    default = 1.0;
  };
in
{
  options.artwork.tweaks = {
    scaling = mkOption {
      type = types.float;
      default = 1.0;
    };

    opacity = {
      desktop = opcacityDef;
      applications = opcacityDef;
      terminal = opcacityDef;
      popups = opcacityDef;
    };

    blur = {
      size = mkOption {
        type = types.ints.unsigned;
        default = 3;
      };
      passes = mkOption {
        type = types.ints.unsigned;
        default = 3;
      };
      noise = mkOption {
        type = types.float;
        default = 0.018;
      };
      contrast = mkOption {
        type = types.float;
        default = 0.9;
      };
      brightness = mkOption {
        type = types.float;
        default = 0.83;
      };
    };

    shadow = {
      enabled = mkOption {
        type = types.bool;
        default = true;
      };
      range = mkOption {
        type = types.ints.unsigned;
        default = 15;
      };
      power = mkOption {
        type = types.ints.unsigned;
        default = 4;
      };
      passes = mkOption {
        type = types.ints.unsigned;
        default = 4;
      };
      color = mkOption {
        type = types.ints.str;
        default = "000000";
      };
      offset = mkOption {
        type = types.ints.str;
        default = "3 3";
      };
      size = mkOption {
        type = types.ints.unsigned;
        default = 3;
      };
    };
  };
}
