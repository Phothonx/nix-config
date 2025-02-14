{ inputs, ...}: {
  nix.registry.devsh.flake = inputs.nix-devshells;

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
}
