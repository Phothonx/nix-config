{
  description = ''My personal config flake'';

  inputs = {
    # NixPkgs unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Agenix
    agenix.url = "github:ryantm/agenix";

    # Walker
    walker.url = "github:abenz1267/walker";

    # Spicetify
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";

    # Firefox
    arkenfox-nixos.url = "github:dwarfmaster/arkenfox-nixos";
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    MiniFox.url = "git+https://codeberg.org/awwpotato/MiniFox";
    MiniFox.flake = false;
     
    # Devshells
    nix-profile-devshells.url = "github:Phothonx/nix-profile-devshells";
    nix-profile-devshells.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    mkSystem = nixpkgs: system: hostName:
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          # host config file
          ./hosts/${hostName}/configuration.nix
          # Global modules, defining options for all hosts
          ./modules/nixos
        ];
        specialArgs = { inherit self inputs hostName; };
      };
  in
  {
    nixosConfigurations = {
      "avalon" = mkSystem nixpkgs "x86_64-linux" "avalon";
    };
  };
}
