{
  description = ''
        ____  __          __  __                        ________      __      
       / __ \/ /_  ____  / /_/ /_  ____  ____  _  __   / ____/ /___ _/ /_____ 
      / /_/ / __ \/ __ \/ __/ __ \/ __ \/ __ \| |/_/  / /_  / / __ `/ //_/ _ \
     / ____/ / / / /_/ / /_/ / / / /_/ / / / />  <   / __/ / / /_/ / ,< /  __/
    /_/   /_/ /_/\____/\__/_/ /_/\____/_/ /_/_/|_|  /_/   /_/\__,_/_/|_|\___/ 
  '';

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    walker = {
      url = "github:abenz1267/walker";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };
    arkenfox-nixos.url = "github:dwarfmaster/arkenfox-nixos";

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
    };
  in
  {
    nixosConfigurations = import ./nixos { inherit self nixpkgs inputs systemConfig userConfig; };
  };
}
