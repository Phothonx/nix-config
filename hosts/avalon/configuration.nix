{ pkgs, inputs, config, ... }:
{
  imports = with inputs.nixos-hardware.nixosModules; [ 
    ./hardware-configuration.nix
    common-pc-ssd
    common-cpu-intel
    common-pc-laptop-acpi_call
  ];

  services.logind.extraConfig = ''
    HandlePowerKey=suspend
    HandlePowerKeyLongPress=hibernate
    HandleLidSwitchExternalPower=ignore
  '';

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
  system.nix.substituters = [
    "https://walker-git.cachix.org"
    "https://walker.cachix.org"
  ];
  system.nix.trusted-public-keys = [
    "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="
    "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
  ];
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
  user.extraGroups = [ "wheel" "audio" "video" ];
  user.home-manager.enable = true;
  user.home-manager.imports = [ ./home.nix ];
  # === DO NOT TOUCH ! ===
  user.home-manager.stateVersion = "23.11";
}
