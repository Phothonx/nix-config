{pkgs, ...}: {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "idleinhibit focus, class:^(firefox)$, title:^(.*YouTube.*)$"
      "idleinhibit fullscreen, class:^(firefox)$"
      "idleinhibit focus, class:^(kitty)$"
      "idleinhibit focus, class:^(kitty)$"

      "float, class:^(file_progress)$"
      "float, class:^(confirm)$"
      "float, class:^(dialog)$"
      "float, class:^(download)$"
      "float, class:^(notification)$"
      "float, class:^(error)$"
      "float, class:^(confirmreset)$"
      "float, title:^(Open File)$"
      "float, title:^(branchdialog)$"
      "float, title:^(Confirm to replace files)$"
      "float, title:^(File Operation Progress)$"
      "float, title:^(About)$"

      "float, class:^(com.saivert.pwvucontrol)$"

      "float, class:^(org.gnome.Loupe)$"

      "float, class:^(io.github.celluloid_player.Celluloid)$"

      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"
    ];

    workspace = [
      "special:special, gapsout:80"
    ];
  };
}
