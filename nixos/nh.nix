{ inputs, systemConfig, ... }:
{
    programs.nh = {
    enable = true;
    flake = systemConfig.dotsPath;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = " --keep-since 7d --keep 5";
    };
  };
}
