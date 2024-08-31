{
  description = ''My personal config's flake'';

  inputs = {

    # NixPkgs unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

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
  };

  outputs = { ... }@inputs:
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
        specialArgs = { inherit inputs hostName; };
      };
  in
  {
    nixosConfigurations = {
      "avalon" = mkSystem inputs.nixpkgs "x86_64-linux" "avalon";
    };
  };
}
