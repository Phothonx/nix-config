{ config, ... }:
{
  home.sessionVariables = {
    HYPRLAND_LOG_WLR = 1;
    HYPRLAND_NO_RT = 1;
    HYPRLAND_NO_SD_NOTIFY = 1;

    NIXOS_OZONE_WL = "1";
    _JAVA_AWT_WM_NONEREPARENTING = "1";
    
    CLUTTER_BACKEND="wayland";

    MOZ_ENABLE_WAYLAND = "1";

    WLR_NO_HARDWARE_CURSORS = "1";
  };

  wayland.windowManager.hyprland.settings.env = [ "QT_QPA_PLATFORMTHEME,qt5ct" ];
}
