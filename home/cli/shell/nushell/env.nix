{ systemConfig, pkgs, lib, ... }:
{
  programs.nushell.environmentVariables = {
    FLAKE = systemConfig.dotsPath;
    SHELL = lib.getExe pkgs.nushell;
  };
}
