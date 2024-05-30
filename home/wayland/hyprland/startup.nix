{ pkgs, lib, artwork, ... }:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = lib.getExe (pkgs.writeShellScriptBin "startup" ''
      ${lib.getExe pkgs.swww} init && ${lib.getExe pkgs.swww} img ${artwork.wallpaper}
      ${lib.getExe pkgs.waybar}
      dunst
      hypridle
      hyprctl setcursor ${artwork.cursor.name} ${builtins.toString artwork.cursor.size}
      hyprlock
       kitty -o background_opacity=0 -o window_padding_width=0 --class="kitty-cava" cava
    '');
  };
}
