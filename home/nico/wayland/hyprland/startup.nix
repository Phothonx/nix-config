{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (config) wallpaper cursor;
  inherit (lib) getExe;
in {
  wayland.windowManager.hyprland.settings = {
    exec-once = with pkgs; [
      "swww-daemon"
      "swww img ${wallpaper} --transition-type none"

      "hyprctl setcursor ${cursor.name} ${builtins.toString cursor.size}"

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
}
