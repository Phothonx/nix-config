{
  flake.nixosModules.nh = {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 1w --keep 5";
      clean.dates = "weekly";
      flake = "$HOME/nix-config";
    };
  };
}
