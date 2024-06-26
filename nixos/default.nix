{ self, nixpkgs, inputs, systemConfig, userConfig, ... }:
let
  pkgs = import nixpkgs { 
    inherit (systemConfig) system ; 
    config.allowUnfree = true;
  };
  lib = nixpkgs.lib;
in
{
  "avalon" = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit pkgs lib self inputs systemConfig userConfig; }; # Default are lib, pkgs, config
    modules = [
      ../hosts/avalon/hardware-configuration.nix
      ./audio.nix
      ./boot.nix
      ./greet.nix
      ./hardware.nix
      ./network.nix
      ./programs.nix
      ./system.nix
      ./user.nix
      ./wayland.nix
      ./xserver.nix
      ./gnome.nix
      ./security.nix
      ./substituers.nix
      ./bluetooth.nix
      ./nh.nix
      ./gaming.nix
    ];
  };
}
