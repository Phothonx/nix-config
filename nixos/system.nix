{ pkgs, systemConfig, ...}: 
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

  security.pam.services.swaylock = {}; # Make swaylock work
  programs.xfconf.enable = true; # thunar
  services.gvfs.enable = true; # Mount, trash, and other functionalities
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