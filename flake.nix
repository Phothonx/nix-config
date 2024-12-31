{
  description = ''My personal config flake'';

  inputs = {
    # NixPkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # NUR
    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    # Hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Agenix
    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    # Spicetify
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";

    # Arkenfox
    arkenfox-nixos.url = "github:dwarfmaster/arkenfox-nixos";
    arkenfox-nixos.inputs.nixpkgs.follows = "nixpkgs";

    # Nix-index database
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    # Devshells
    nix-devshells.url = "github:Phothonx/nix-devshells";
    nix-devshells.inputs.nixpkgs.follows = "nixpkgs";

    # # Disko
    # disko.url = "github:nix-community/disko/latest";
    # disko.inputs.nixpkgs.follows = "nixpkgs";

    # # Impermanence
    # inputs.impermanence.url = "github:nix-community/impermanence";

    # # Nix on droid
    # nix-on-droid.url = "github:nix-community/nix-on-droid/release-24.05";
    # nix-on-droid.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs:
  let
    mkLib = pkgs:
      pkgs.lib.extend (
        self: super:
          (import ./lib {
            inherit pkgs;
            lib = super;
          })
          // inputs.home-manager.lib
      );

    systems = [
      "x86_64-linux"
    ];

    withSystems = systems: withPkgs:
      nixpkgs.lib.genAttrs systems (
        system: (withPkgs nixpkgs.legacyPackages.${system})
      );

    forEachSystems = withSystems systems;

    mkSystem = nixpkgs: system: hostName: let
      # https://discourse.nixos.org/t/using-nixpkgs-legacypackages-system-vs-import/17462
      # https://zimbatm.com/notes/1000-instances-of-nixpkgs
      # need to import if i want overlays & unfree packages
      # pkgs = nixpkgs.legacyPackages.${system}.appendOverlays [ self.outputs.overlays.additions self.overlays.modifications ];
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          self.outputs.overlays.additions
          self.overlays.modifications
          inputs.nur.overlays.default
          ];
        config.allowUnfree = true;
      };
      lib = mkLib pkgs;
    in
      nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        modules = [
          ./hosts/${hostName}/configuration.nix
          self.outputs.nixosModules.default
        ];
        specialArgs = {
          inherit self inputs lib hostName;
        };
      };
  in {
    packages = forEachSystems (pkgs: import ./packages pkgs);

    overlays = import ./overlays {inherit inputs;};

    formatter = forEachSystems (pkgs: pkgs.alejandra);

    nixosModules.default = import ./modules/nixos;
    nixosModules.home-manager = import ./modules/home;

    nixosConfigurations = {
      "avalon" = mkSystem nixpkgs "x86_64-linux" "avalon";
      # "camlann" = mkSystem inputs.nixpkgs-stable "" "camlann";
      # "merlin" = mkSystem nixpkgs "" "merlin";
    };
  };
}
