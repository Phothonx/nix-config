{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.nix = {pkgs, ...}: {
    imports = [
      inputs.nix-index-database.nixosModules.nix-index
      # self.nixosModules.impermanence
    ];

    programs.nix-index-database.comma.enable = true;

    programs.direnv = {
      enable = true;
      silent = true;
      direnvrcExtra = '''';
      nix-direnv.enable = true;
    };

    programs.nix-ld.enable = true;

    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.allowUnsupportedSystem = true;

    # skip broken test
    nixpkgs.overlays = [
      (final: prev: {
        openldap = prev.openldap.overrideAttrs (_: {
          doCheck = false;
        });
      })
    ];

    nix = {
      settings.experimental-features = ["nix-command" "flakes"];
      settings.auto-optimise-store = true;
      registry.self.flake = self;
      channel.enable = false;
    };

    documentation.man.cache.enable = true;
    documentation.dev.enable = true;

    environment.systemPackages = with pkgs; [
      nix-output-monitor
      nix-tree
      nil
      nixd
      alejandra
      nixfmt
      nix-inspect
      manix

      man-pages
      man-pages-posix
      tldr
    ];

    nix.settings = {
      substituters = [
        "https://cache.nixos.org?priority=10"
        "https://nix-community.cachix.org"
        "https://nix-gaming.cachix.org"
        "https://noctalia.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];
    };

    persist.user.directories = [
      ".local/share/direnv"
    ];
  };
}
