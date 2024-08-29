{
  description = ''My personal config's flake'';

  inputs = {

    # NixPkgs & Unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    lib = nixpkgs.lib;

    mkSystem = pkgs: system: hostName:
      lib.nixosSystem {
        inherit system;
        modules = [
          # host config file
          ./hosts/${hostName}/configuration.nix
          # Global modules, defining options for all hosts
          self.outputs.nixosModules.default
        ];
        specialArgs = { inherit inputs hostName; };
      };
  in
  {
    nixosModules.default = import ./modules/nixos;
    homeManagerModules.default = import ./modules/home-manager;

    nixosConfigurations = {
      "avalon" = mkSystem nixpkgs "x86-64_linux" "avalon";
    };
  };
}
