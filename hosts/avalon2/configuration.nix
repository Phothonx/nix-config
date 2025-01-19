{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = with inputs.nixos-hardware.nixosModules; [
    ./hardware-configuration.nix
    common-pc-ssd
    common-cpu-intel
  ];

  services.logind = {
    powerKey = "suspend";
    powerKeyLongPress = "hibernate";
  };

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
  ];

  # Hardware
  hardware.audio.enable = true;
  hardware.network.enable = true;
  hardware.bluetooth.enable = true;
  hardware.power.enable = true;

  # System
  programs.nh.enable = true;
  programs.nh.flake = "/home/nico/.dotfiles";
  system.boot.enable = true;
  services.greetd.enable = true;
  system.locale.enable = true;
  system.nix.enable = true;
  system.time.enable = true;
  system.xkb.enable = true;
  system.agenix.enable = true;
  programs.dconf.enable = true; # gnome
  # === DO NOT TOUCH ! ===
  system.stateVersion = "23.11";

  # User
  user.name = "nico";
  user.fullName = "Nicolas";
  user.hashedPasswordFile = config.age.secrets.secret1.path;
  user.extraGroups = ["wheel" "audio" "video"];
  user.home-manager.enable = true;
  user.home-manager.imports = [./home.nix];
  # === DO NOT TOUCH ! ===
  user.home-manager.stateVersion = "23.11";
}
