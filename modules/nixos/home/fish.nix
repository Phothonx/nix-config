{ config, lib, ... }:
with lib;
let
  cfg = config.home-manager.users.${config.user.name}.programs.fish;
in
{
  config = mkIf cfg.enable {
    programs.fish.enable = true;
  };
}
