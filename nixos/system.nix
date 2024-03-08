{ pkgs, systemConfig, ... }:
{
  nix = {
    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  services.gnome.gnome-keyring.enable = true;

  programs.dconf.enable = true; # gnome
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.dbus.implementation = "broker";

  programs.xfconf.enable = true; # thunar
  services.tumbler.enable = true; # Thumbnail support for images
  programs.thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
          thunar-archive-plugin
          thunar-volman
      ];
  };

  nixpkgs = {
    config.allowUnfree = true;
  };

  time.timeZone = systemConfig.timeZone;
  i18n.defaultLocale = systemConfig.locale;
  console = {
    keyMap = systemConfig.layout;
  };

  system.stateVersion = "23.11";
}