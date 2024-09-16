{ config, lib, ... }:
with lib;
let
  cfg = config.programs.nh;
in
{
  config = mkIf cfg.enable {
    programs.nh = {
      clean.enable = true;
      clean.extraArgs = "--keep-since 1w --keep 3";
      clean.dates = "weekly";
      flake = mkDefault "/home/nico/.dotfiles";
    };
  };
}
