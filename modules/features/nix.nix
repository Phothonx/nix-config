{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.nix = {pkgs, ...}: {
    imports = [
      inputs.nix-index-database.nixosModules.nix-index
    ];

    programs.nix-index-database.comma.enable = true;

    programs.direnv = {
      enable = true;
      silent = true;
      direnvrcExtra = '''';
      nix-direnv.enable = true;
    };

    programs.nix-ld.enable = true;

    # nixpkgs config (allowUnfree, overlays) lives in flake.nix so the single
    # pkgs instance is shared with packages/ and devshells/. The hosts reuse it
    # via `nixpkgs.pkgs` (hosts/*/default.nix), so it must not be set here.

    nix = {
      registry.self.flake = self;
      channel.enable = false;

      settings = {
        experimental-features = ["nix-command" "flakes"];
        auto-optimise-store = true;
        builders-use-substitutes = true;

        # keep dev shell / direnv build inputs from being garbage-collected
        keep-outputs = true;
        keep-derivations = true;

        substituters = [
          "https://cache.nixos.org?priority=10"
          "https://nix-community.cachix.org"
          "https://nix-gaming.cachix.org"
          "https://noctalia.cachix.org"
          "https://cuda-maintainers.cachix.org"
        ];
        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
          "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
          "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
        ];
      };
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

    persist.user.directories = [
      ".local/share/direnv"
    ];
  };
}
