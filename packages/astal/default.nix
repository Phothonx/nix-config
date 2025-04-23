{pkgs, ...}:
pkgs.astal.lib.mkLuaPackage {
  inherit pkgs;
  name = "my-shell"; # how to name the executable
  src = ./.; # should contain init.lua

  # add extra glib packages or binaries
  extraPackages =
    [
      pkgs.dart-sass
    ]
    ++ (with pkgs.astal; [
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
}
