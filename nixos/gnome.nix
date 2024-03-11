{ config, pkgs, ... }:
{
  services.gnome.gnome-keyring.enable = true;

  programs.dconf.enable = true; # gnome
  services.gvfs.enable = true; # Mount, trash, and other functionalities
}
