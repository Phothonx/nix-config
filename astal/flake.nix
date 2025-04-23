{
  inputs = {
    nixpkgs.url = "nixpkgs";
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    astal,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.default = astal.lib.mkLuaPackage {
      inherit pkgs;
      name = "my-shell"; # how to name the executable
      src = ./.; # should contain init.lua

      # add extra glib packages or binaries
      extraPackages =
        [
          pkgs.dart-sass

          pkgs.jetbrains-mono
          pkgs.ubuntu-classic
        ]
        ++ (with astal.packages.${system}; [
          apps
          battery
          io
          wireplumber
          bluetooth
          hyprland
          mpris
          network
          notifd
          tray
        ]);
    };

    overlays.default = final: prev: {my-shell = self.outputs.packages.${system}.default;}; # make sure final.pkgs.system == system
  };
}
