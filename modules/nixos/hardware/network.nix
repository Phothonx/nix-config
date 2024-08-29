{ config, hostName, lib, ... }:
with lib;
let
  cfg = config.hardware.network;
in {
  options.hardware.network = with types; {
    enable = mkEnableOption "Enable networkmanager";
  };

  config = mkIf cfg.enable {
    networking = {
      inherit hostName;
      networkmanager.enable = true;
    };

    user.extraGroups = [ "networkmanager" ];

    # https://github.com/NixOS/nixpkgs/issues/180175
    systemd.services.NetworkManager-wait-online.enable = false;
  };
}
