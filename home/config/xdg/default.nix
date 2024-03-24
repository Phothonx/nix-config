{ config, pkgs, ... }:
let
  browser = ["firefox.desktop"];
  zathura = ["org.pwmt.zathura.desktop"];
  imageViewer = ["org.gnome.Loupe.desktop"];
  videoPlayer = ["io.github.celluloid_player.Celluloid.desktop"];
  audioPlayer = ["io.bassi.Amberol.desktop"];

  associations = {
    "text/html" = browser;

    "x-scheme-handler/http" = browser;
    "x-scheme-handler/https" = browser;
    "x-scheme-handler/ftp" = browser;
    "x-scheme-handler/about" = browser;
    "x-scheme-handler/unknown" = browser;
    "application/x-extension-htm" = browser;
    "application/x-extension-html" = browser;
    "application/x-extension-shtml" = browser;
    "application/xhtml+xml" = browser;
    "application/x-extension-xhtml" = browser;
    "application/x-extension-xht" = browser;

    "application/pdf" = zathura;

    "audio/mp3" = audioPlayer;
    "audio/wav" = audioPlayer;
    "audio/aac" = audioPlayer;
    "audio/flac" = audioPlayer;

    "video/mp4" = videoPlayer;
    "video/avi" = videoPlayer;
    "video/mkv" = videoPlayer;

    "image/png" = imageViewer;
    "image/jpeg" = imageViewer;
    "image/gif" = imageViewer;
    "image/svg" = imageViewer;

    "x-scheme-handler/spotify" = ["spotify.desktop"];
  };
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

    userDirs = {
      enable = true;
      createDirectories = true;
      templates = null;
      publicShare = null;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };

    mimeApps = {
      enable = true;
      associations.added = associations;
      defaultApplications = associations;
    };
  };
}
