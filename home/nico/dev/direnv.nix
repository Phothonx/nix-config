{...}: {
  programs.direnv = {
    enable = true;
    silent = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
}
