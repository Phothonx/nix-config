{ pkgs, ... }:
{
  specialisation = {
    gruvbox.configuration = {
      home-manager.extraSpecialArgs = rec {
        colors = artwork.palette;
        artwork = import ./themes/gruvbox.nix { inherit pkgs; };
      };
    };
  };
}
