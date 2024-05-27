{ self, pkgs, ... }:
{
  nix.registry.self.flake = self; 

  specialisation = {
    gruvbox.configuration = {
      home-manager.extraSpecialArgs = rec {
        colors = artwork.palette;
        artwork = import ./themes/gruvbox.nix { inherit pkgs; };
      };
    };
    
    mocha.configuration = {
      home-manager.extraSpecialArgs = rec {
        colors = artwork.palette;
        artwork = import ./themes/mocha.nix { inherit pkgs; };
      };
    };
  };
}
