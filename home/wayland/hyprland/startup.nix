{ pkgs, lib, artwork, ... }:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = with lib; with pkgs;[
      "swww-daemon"
      "swww img ${artwork.wallpaper} --transition-type none"
      "hyprctl setcursor ${artwork.cursor.name} ${builtins.toString artwork.cursor.size}"
      "${wl-clipboard}/bin/wl-paste --watch cliphist store"
      (getExe waybar)
      (getExe dunst)
      (getExe hypridle)
      # "${getExe kitty} -o background_opacity=0 -o window_padding_width=0 --class=\"kitty-cava\" ${getExe cava}"
      "${getExe hyprlock} --immediate"
    ]; 
  };
}
