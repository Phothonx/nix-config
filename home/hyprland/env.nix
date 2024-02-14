{ ... }:
{
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    _JAVA_AWT_WM_NONEREPARENTING = "1";
    GDK_BACKEND = "wayland";
	  GTK_USE_PORTAL = "1";

    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORM = "xcb";
    QT_QPA_PLATFORMTHEME = "qt5ct";

    XDG_CURRENT_DESKTOP = "Hyprland";
	  XDG_SESSION_DESKTOP = "Hyprland";
	  XDG_SESSION_TYPE = "wayland";

    MOZ_ENABLE_WAYLAND = "1";

    WLR_NO_HARDWARE_CURSORS = "1";

    NIXOS_XDG_OPEN_USE_PORTAL=1;

    BROWSER = "firefox";
    TERMINAL = "kitty";
  };
}