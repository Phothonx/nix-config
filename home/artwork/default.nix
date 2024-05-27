{ lib, config, pkgs, ... }:
{
  imports = [ ./specialisations.nix ];

  config = lib.mkIf (config.specialisation != {}) {
    home-manager.extraSpecialArgs = rec {
      colors = artwork.palette;
      artwork = import ./themes/mocha.nix { inherit pkgs; };
    };
  };
}