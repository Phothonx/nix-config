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

      "${my-shell}/bin/my-shell"
    ];
  };
}
