{
  description = ''My personal config's flake'';

  inputs = {

    # NixPkgs & Unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Walker
    walker.url = "github:abenz1267/walker";

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
          ./modules/nixos
        ];
        specialArgs = { inherit inputs hostName; };
      };
  in
  {
    nixosConfigurations = {
      "avalon" = mkSystem nixpkgs "x86-64_linux" "avalon";
    };
  };
}
