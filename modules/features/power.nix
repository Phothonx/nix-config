{
  flake.nixosModules.power = {
    services.upower.enable = true;
    services.tuned = {
      enable = true;
      ppdSupport = true;
    };
  };
}
