{
  description = ''My personal config flake'';

  inputs = {
    # NixPkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

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

    # # Disko
    # disko.url = "github:nix-community/disko";
    # disko.inputs.nixpkgs.follows = "nixpkgs";
    # 
    # # Impermanence
    # inputs.impermanence.url = "github:nix-community/impermanence";

    # Nix on droid
    nix-on-droid.url = "github:nix-community/nix-on-droid/release-24.05";
    nix-on-droid.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    mkLib = nixpkgs:
      nixpkgs.lib.extend (self: super: 
        (import ./lib super) // inputs.home-manager.lib
      );

    mkSystem = nixpkgs: system: hostName:
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/${hostName}/configuration.nix
          self.outputs.nixosModules.default
        ];
        specialArgs = {
          inherit self inputs hostName;
          lib = mkLib nixpkgs;
        };
      };
  in
  {
    nixosModules.default = import ./modules/nixos;
    nixosModules.home-manager = import ./modules/home;

    nixosConfigurations = {
      "avalon" = mkSystem nixpkgs "x86_64-linux" "avalon";
    };
  };
}
