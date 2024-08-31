{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.xdg;
in
{
  config = mkIf cfg.enable {
    home.sessionVariables = with config.xdg; {
      XDG_CURRENT_DESKTOP = "Hyprland";
	    XDG_SESSION_DESKTOP = "Hyprland";
	    XDG_SESSION_TYPE = "wayland";
      NIXOS_XDG_OPEN_USE_PORTAL=1;

      BROWSER = "firefox";
      TERMINAL = "kitty";

      # home cleaning
      HISTFILE = "${stateHome}/bash/history";
      CARGO_HOME = "${dataHome}/cargo";
      IPYTHONDIR = "${configHome}/ipython";
      JUPYTER_CONFIG_DIR = "${configHome}/jupyter";
      XCOMPOSECACHE = "${cacheHome}/X11/xcompose"; 
      OPAMROOT = "${dataHome}/opam";
      ERRFILE = "${cacheHome}/X11/xsession-errors";
    };

    home.packages = with pkgs; [
      xdg-utils
      xdg-ninja
    ];

    xdg = {
      portal = {
        enable = true;
        config.common.default = "*";
        extraPortals = [
          pkgs.xdg-desktop-portal-gtk
        ];
      };

      cacheHome = config.home.homeDirectory + "/.local/cache";

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
  };
}
