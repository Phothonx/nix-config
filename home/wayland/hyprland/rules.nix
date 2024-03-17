{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "idleinhibit focus, class:^(firefox)$, title:^(.*YouTube.*)$"
      "idleinhibit fullscreen, class:^(firefox)$"
      "idleinhibit focus,class:foot"

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
      "center, class:^(org.pipewire.Helvum)$"

      "float, class:^(org.gnome.Nautilus)$"
      "float, class:^(org.gnome.NautilusPreviewer)$"
      "size 1500 1000, title:^(Loading…)$" # Nautilus
      "center, class:^(org.gnome.Nautilus)$"
      "center, class:^(org.gnome.NautilusPreviewer)$"

      "float, title:^(Calculator)$"
      "size 550 700, title:^(Calculator)$"
      "center, title:^(Calculator)$"

      "float, title:^(Characters)$"
      "size 800 900, title:^(Characters)$"
      "center, title:^(Characters)$"

      "float, title:^(Clocks)$"
      "size 1000 800, title:^(Clocks)$"
      "center, title:^(Clocks)$"

      "float, title:^(overskride)$"
      "size 800 1000, class:^(io.github.kaii_lb.Overskride)$"
      "center, title:^(overskride)$"

      "float, title:^(Amberol)$"
      "size 800 1000, title:^(Amberol)$"
      "center, title:^(Amberol)$"

      "float, class:^(org.gnome.Loupe)$"
      "center, class:^(org.gnome.Loupe)$"

      "float, title:^(Easy Effects)$"
      "size 1000 800, title:^(Easy Effects)$"
      "center, title:^(Easy Effects)$"

      "float, class:^(io.github.celluloid_player.Celluloid)$"
      "center, class:^(io.github.celluloid_player.Celluloid)$"

      "float, title:^(Calendar)$"
      "size 1000 800, title:^(Calendar)$"
      "center, title:^(Calendar)$"

      "float, class:^(org.pwmt.zathura)$"
      "center, class:^(org.pwmt.zathura)$"

      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"
    ];
  };
}
