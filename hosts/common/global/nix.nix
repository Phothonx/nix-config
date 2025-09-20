{
  lib,
  inputs,
  pkgs,
  self,
  ...
}: {
  environment.systemPackages = with pkgs; [
    git
    vim
    wget

    nvd
    nix-output-monitor
    nix-tree
    alejandra
    nixfmt-rfc-style
    nix-index

    man-pages
    man-pages-posix
  ];

  nix = {
    settings = {
      # extra-substituters = [];
      # extra-trusted-public-keys = [];

      experimental-features = ["nix-command" "flakes"];
      http-connections = 50;
      warn-dirty = false;
      log-lines = 50;
      nix-path = lib.mkForce "nixpkgs=/etc/nix/inputs/nixpkgs";
      auto-optimise-store = true;
      use-xdg-base-directories = true;
      builders-use-substitutes = true;
      trusted-users = ["root" "@wheel"];
      flake-registry = ""; # Disable global flake registry
    };

    gc.automatic = false;

    # make `nix run nixpkgs#nixpkgs` use the same nixpkgs as the one used by this flake.
    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];

    registry.self.flake = self;
    channel.enable = false;
  };

  documentation = {
    dev.enable = true;

    man = {
      # In order to enable to mandoc man-db has to be disabled.
      man-db.enable = false;
      mandoc.enable = true;
    };
  };

  environment.sessionVariables = {
    FLAKE = "/home/nico/Dev/nix-config/";
  };

  # but NIX_PATH is still used by many useful tools, so we set it to the same value as the one used by this flake.
  # Make `nix repl '<nixpkgs>'` use the same nixpkgs as the one used by this flake.
  environment.etc."nix/inputs/nixpkgs".source = "${inputs.nixpkgs}";
}
