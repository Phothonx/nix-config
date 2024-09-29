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
      exec-once = with lib;
      with pkgs; [
        "swww-daemon"
        "swww img ${theme.wallpaper} --transition-type none"
        "hyprctl setcursor ${theme.cursor.name} ${builtins.toString theme.cursor.size}"
        "${wl-clipboard}/bin/wl-paste --watch cliphist store"
        (getExe waybar)
        (getExe dunst)
        # (getExe hypridle)
        # "${getExe kitty} -o background_opacity=0 -o window_padding_width=0 --class=\"kitty-cava\" ${getExe cava}"
        # "${getExe hyprlock} --immediate"
      ];
    };
  };
}
