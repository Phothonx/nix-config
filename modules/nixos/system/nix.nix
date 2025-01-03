{
  config,
  lib,
  inputs,
  pkgs,
  self,
  ...
}:
with lib; let
  cfg = config.system.nix;
in {
  options.system.nix = with types; {
    enable = mkEnableOption "Enable nix configuration management";
    substituters = mkOpt (listOf str) [] "Add extra substituters";
    trusted-public-keys = mkOpt (listOf str) [] "Extra substituers's keys";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      nvd
      nix-output-monitor
      nix-tree
      alejandra
      nixfmt-rfc-style
      inputs.nix-index-database.packages.${pkgs.system}.default
    ];

    nix = {
      settings = {
        inherit (cfg) substituters trusted-public-keys;

        experimental-features = ["nix-command" "flakes"];
        http-connections = 50;
        warn-dirty = false;
        log-lines = 50;
        nix-path = lib.mkForce "nixpkgs=/etc/nix/inputs/nixpkgs";
        auto-optimise-store = true;
        use-xdg-base-directories = true;
        builders-use-substitutes = true;
        trusted-users = ["root" config.user.name];
        flake-registry = ""; # Disable global flake registry
      };

      gc.automatic = false;

      # make `nix run nixpkgs#nixpkgs` use the same nixpkgs as the one used by this flake.
      registry.nixpkgs.flake = inputs.nixpkgs;
      nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

      registry.self.flake = self;
      channel.enable = false;
    };

    # but NIX_PATH is still used by many useful tools, so we set it to the same value as the one used by this flake.
    # Make `nix repl '<nixpkgs>'` use the same nixpkgs as the one used by this flake.
    environment.etc."nix/inputs/nixpkgs".source = "${inputs.nixpkgs}";
  };
}
