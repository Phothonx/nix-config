{pkgs, ...}: {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "idleinhibit focus, class:^(firefox)$, title:^(.*YouTube.*)$"
      "idleinhibit fullscreen, class:^(firefox)$"
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

      "float, class:^(org.pipewire.Helvum)$"
      "size 1400 800, class:^(org.pipewire.Helvum)$"

      "float, class:^(com.saivert.pwvucontrol)$"
      "size 1100 600, class:^(com.saivert.pwvucontrol)$"

      "float, class:^(org.gnome.Loupe)$"
      "center, class:^(org.gnome.Loupe)$"

      "float, class:^(io.github.celluloid_player.Celluloid)$"
      "center, class:^(io.github.celluloid_player.Celluloid)$"

      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"

      "size 1400 900, class:^(kitty)$"
      "size 1700 1100, class:^(firefox)$"
    ];

    workspace = [
      "special:special, gapsout:80"
    ];
  };
}
