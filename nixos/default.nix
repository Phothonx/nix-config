{ self, nixpkgs, username, inputs, ... }:
let
  system = "x86_64-linux";
  pkgs = import nixpkgs { 
    inherit system; 
  };
  lib = nixpkgs.lib;
in
{
  avalon = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self username inputs; };
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
    ];
  };
}