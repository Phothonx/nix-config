{
  config,
  pkgs,
  ...
}: let
  inherit (config) wallpaper cursor;
in {
  wayland.windowManager.hyprland.settings = {
    exec-once = with pkgs; [
      "${swww}/bin/swww-daemon"
      "${swww}/bin/swww img ${wallpaper} --transition-type none"

      "hyprctl setcursor ${cursor.name} ${builtins.toString cursor.size}"

      "${pkgs.systemd}/bin/systemctl --user start ${hyprpolkitagent}/bin/hyprpolkitagent"

      # "${my-shell}/bin/my-shell"
    ];
  };
}
