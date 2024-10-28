{
  lib,
  config,
  hostName,
  pkgs,
  ...
}:
with lib; let
  cfg = config.hardware.disko;
in {
  imports = [ inputs.disko.nixosModules.disko ];

  options.hardware.disko = {
    enable = mkEnableOption "daclarative disk partitionning";
  };

  config = mkIf cfg.enable {
    imports = [ ./../../../hosts/${hostName}/disko-config.nix ];
  };
}
