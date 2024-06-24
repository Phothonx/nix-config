{ config, pkgs, ... }:
let # inspired/copypasted from linuxmobile <3
  imageTypes = ["png" "svg" "jpeg" "gif"];
  videoTypes = ["mp4" "avi" "mkv"];
  audioTypes = ["mp3" "flac" "wav" "aac"];

  xdgAssociations = type: program: list:
    builtins.listToAttrs (
      map 
        (e: { name = "${type}/${e}"; value = program; })
        list
    );
in
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

    mimeApps = {
      enable = true;
      defaultApplications = ({
        "application/pdf" = ["evince.desktop"];
        "text/plain" = ["nvim.desktop"];
      }
      // xdgAssociations "image" ["org.gnome.Loupe.desktop"] imageTypes
      // xdgAssociations "video" ["io.github.celluloid_player.Celluloid.desktop"] videoTypes
      // xdgAssociations "audio" ["io.bassi.Amberol.desktop"] audioTypes);
    };
  };
}
