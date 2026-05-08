{
  flake.nixosModules.power = {pkgs, ...}: {
    services.thermald.enable = true;
    services.upower.enable = true;
    services.tuned = {
      enable = true;
      ppdSupport = true;
    };

    environment.systemPackages = with pkgs; [
      phoronix-test-suite
    ];
  };
}
