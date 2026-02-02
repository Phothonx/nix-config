{...}: {
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "idle_inhibit focus, match:class firefox, match:title .*YouTube.*"
      "idle_inhibit fullscreen, match:class firefox"
      "idle_inhibit focus, match:class kitty"
      "idle_inhibit focus, match:class kitty"

      "float on, match:class file_progress"
      "float on, match:class confirm"
      "float on, match:class dialog"
      "float on, match:class download"
      "float on, match:class notification"
      "float on, match:class error"
      "float on, match:class confirmreset"
      "float on, match:title Open File"
      "float on, match:title branchdialog"
      "float on, match:title Confirm to replace files"
      "float on, match:title File Operation Progress"
      "float on, match:title About"

      "float on, match:class com.saivert.pwvucontrol"

      "float on, match:class org.gnome.Loupe"

      "float on, match:class io.github.celluloid_player.Celluloid"

      "float on, match:title Picture-in-Picture"
      "pin on, match:title Picture-in-Picture"
    ];

    layerrule = [
      "blur on, match:namespace bar_0"
    ];

    workspace = [
      "special:special, gapsout:80"
      # "special:special, shadow:false"
    ];
  };
}
