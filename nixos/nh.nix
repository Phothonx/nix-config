{ inputs, systemConfig, ... }:
{
  imports = [ inputs.nh.nixosModules.default ];

    nh = {
    enable = true;
    flake = systemConfig.dotsPath;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = " --keep-since 7d --keep 5";
    };
  };
}