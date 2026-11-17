{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    impermanence.url = "github:nix-community/impermanence";
    impermanence.inputs.nixpkgs.follows = "";

    wrappers.url = "github:BirdeeHub/nix-wrapper-modules";
    wrappers.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    meglingbot.url = "github:Phothonx/MeglingBot";
    meglingbot.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        inputs.disko.flakeModules.default
        (inputs.import-tree [./modules ./packages ./devshells ./theme.nix])
      ];
      flake.templates = import ./templates;

      systems = [
        # "aarch64-darwin"
        "aarch64-linux"
        # "x86_64-darwin" deprecated
        "x86_64-linux"
      ];

      # Single configured nixpkgs instance, shared by packages/, devshells/ and
      # the NixOS hosts (which reuse it via `nixpkgs.pkgs` in hosts/*/default.nix).
      perSystem = {system, ...}: {
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
          config.allowUnsupportedSystem = true;
          overlays = [
            # TODO: drop once nixpkgs ships Vencord >= 1.15.16.
            # 1.15.13 breaks on Discord's rspack update (blank gray screen in webcord-vencord).
            (final: prev: let
              bumpVencord = pkg:
                pkg.overrideAttrs (finalAttrs: old: {
                  version = "1.15.16";
                  src = prev.fetchFromGitHub {
                    owner = "Vendicated";
                    repo = "Vencord";
                    tag = "v${finalAttrs.version}";
                    hash = "sha256-aUJubLJpyLAZWiOezqFxPY6oVPgWVPQpajFqrJvrO9U=";
                  };
                  # upstream now pins @types/react via catalog; nixpkgs patch no longer applies
                  patches = [];
                  postPatch = "";
                  env = old.env // {VENCORD_HASH = finalAttrs.version;};
                  pnpmDeps = old.pnpmDeps.overrideAttrs {
                    inherit (finalAttrs) src patches postPatch;
                    outputHash = "sha256-HS8uZNepvDefjrsG3buVLFCVv7sHvazcwdpcT3EQ/78=";
                  };
                });
            in {
              vencord = bumpVencord prev.vencord;
              vencord-web-extension = bumpVencord prev.vencord-web-extension;
            })
          ];
        };
      };
    };
}
