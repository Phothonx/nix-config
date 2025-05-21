{lib, ...}: {
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 1w --keep 3";
    clean.dates = "weekly";
  };

  environment.sessionVariables = {
    NH_FLAKE = "/home/nico/Dev/nix-config/";
  };
}
