{
  description = ''
  
  '';

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nh = {
      url = "github:viperML/nh";
      inputs.nixpkgs.follows = "nixpkgs"; # override this repo's nixpkgs snapshot
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprlock.url = "github:hyprwm/hyprlock";
    hypridle.url = "github:hyprwm/hypridle";
    hyprland-plugins = {
    url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NvChad.url = "github:NvChad/nix";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:the-argus/spicetify-nix";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    systemConfig = {
      system = "x86_64-linux";
      hostName = "avalon";
      timeZone = "Europe/Paris";
      locale = "en_US.UTF-8";
      layout = "fr";
      dotsPath = "/home/nico/.dotfiles"; # a string is important (or nh will always evaluate the same dotfiles from the nix store)
    };

    userConfig = {
      userName = "nico";
      name = "Nicolas";
      email = "";
      sheme = "catppuccin-mocha"; # see in ./theme/shemes/*
      accent = "";
      wallpaper = ./wallpapers/graphism/crystal-waves-tern.png; # see in ./wallpapers
    };
  in
  {
    nixosConfigurations = import ./nixos { inherit self nixpkgs inputs systemConfig userConfig; };
  };
}
