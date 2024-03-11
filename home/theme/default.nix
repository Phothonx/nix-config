{ pkgs, theme, config, ... }:
with theme;
{
  home.packages = fonts.packages ++ [ cursor.package ] ++ [ icons.package ];

  home.pointerCursor = {
    package = cursor.package;
    name = cursor.name;
    size = cursor.size;
  };

  home.sessionVariables = {
    XCURSOR_THEME = cursor.name;
    XCURSOR_SIZE = cursor.size;

    GTK_THEME = "Catppuccin-Mocha-Compact-Mauve-Dark";

    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORM = "xcb";
    QT_QPA_PLATFORMTHEME = "gtk2";
  };

  gtk = {
    enable = true;

    font  = { 
      name = fonts.sansSerif;
      size = fonts.sizes.applications;
    };

    cursorTheme = cursor;
    iconTheme = icons;

    theme = {
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact"; # "standard" "compact"
        #tweaks = [ "rimless" ]; # "black" "rimless" "normal" 
        variant = "mocha";
      };
      name = "Catppuccin-Mocha-Compact-Mauve-Dark";
    };
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style.package = pkgs.catppuccin-qt5ct;
  };
}
