{
  config,
  pkgs,
  ...
}: {
  home.sessionVariables = with config.xdg; {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";

    BROWSER = "firefox";
    TERMINAL = "kitty";

    # home cleaning
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
    enable = true;
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config.common.default = "*";
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
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
}
