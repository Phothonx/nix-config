{ pkgs, lib, artwork, ... }:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = with lib; with pkgs;[
      "${getExe swww} init && ${getExe swww} img ${artwork.wallpaper}"
      "hyprctl setcursor ${artwork.cursor.name} ${builtins.toString artwork.cursor.size}"
      (getExe waybar)
      (getExe dunst)
      (getExe hypridle)
      "${getExe kitty} -o background_opacity=0 -o window_padding_width=0 --class=\"kitty-cava\" ${getExe cava}"
      "${getExe hyprlock} --immediate"
    ]; 
  };
}
