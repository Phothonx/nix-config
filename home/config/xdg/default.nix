{ config, pkgs, ... }:
{
  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
	  XDG_SESSION_DESKTOP = "Hyprland";
	  XDG_SESSION_TYPE = "wayland";
    NIXOS_XDG_OPEN_USE_PORTAL=1;

    BROWSER = "firefox";
    TERMINAL = "kitty";
  };

  home.packages = with pkgs; [
    xdg-utils
    xdg-ninja
  ];

  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;
      templates = null;
      publicShare = null;
      music = null;
      pictures = null;
      videos = null;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory}/Medias/Screenshots";
        XDG_DEV_DIR = "${config.home.homeDirectory}/Dev";
        XDG_MEDIAS_DIR = "${config.home.homeDirectory}/Medias";
      };
    };
  };
}
