{ lib, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    firefox
  ];

  # Hardware
  hardware.audio.enable = true;
  hardware.network.enable = true;
  
  # System
  system.boot.enable = true;
  system.locale.enable = true;
  system.nix.enable = true;
  system.time.enable = true;
  system.xkb.enable = true;
  # === DO NOT TOUCH ! ===
  system.stateVersion = "23.11";

  # User 
  user.name = "nico";
  user.fullName = "Nicolas";
  user.extraGroups = [ "wheel" "audio" "video" ];
  user.home-manager.enable = true;
  user.home-manager.imports = [ ./home.nix ];
  # === DO NOT TOUCH ! ===
  user.home-manager.stateVersion = "23.11";
}
