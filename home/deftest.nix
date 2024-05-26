{ pkgs, lib, config, ... }:
{
  config = lib.mkIf (config.specialisation != {}) {
    _module.args = rec {
      colors = artwork.palette;
      artwork = import ./artwork/default.nix { inherit pkgs; };
    };
  };
}
