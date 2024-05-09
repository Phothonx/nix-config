{ lib, ... }:
with lib;
let
  cfg = config.artwork;

  mkColors = n: 
  if n <= 0 then { base00 = mkOption { type = types.str; }; }
  else {
    "base${ if n < 10 then "0${n}" else n}" = mkOption { type = types.str; };
    inherit (mkColors n - 1);
    };

  paletteType = types.submodule (mkColors 23);
in
{
  options.artwork = {
    author = "https://github.com/catppuccin";
    name = "catppuccin-mocha";
    accent = mkOption {
      type = types.str;
    };
    palette = {

    };
    mnemonic = {

    };
  };

  config = {

  };
}
