{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.wayland.windowManager.hyprland;
  inherit (config) theme;
in {
  config = mkIf cfg.enable {
    wayland.windowManager.hyprland.settings = {
      exec-once =
      with pkgs; [
        "swww-daemon"
        "swww img ${theme.wallpaper} --transition-type none"

        "hyprctl setcursor ${theme.cursor.name} ${builtins.toString theme.cursor.size}"

        "${wl-clipboard}/bin/wl-paste --watch cliphist store"

        (getExe waybar)

        (getExe dunst)

        "hyprshade install"
        "systemctl --user enable --now hyprshade.timer"
      ];

      exec = [
        "hyprshade auto"
      ];
    };
  };
}
