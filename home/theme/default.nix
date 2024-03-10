{ pkgs, theme, ... }:
with theme;
{
  home.packages = fonts.packages ++ [ cursor.package ] ++ [ icons.package ];

  home.pointerCursor = {
    package = cursor.package;
    name = cursor.name;
    size = cursor.size;
    gtk.enable = true;
  };

  home.sessionVariables = {
    XCURSOR_THEME = cursor.name;
    XCURSOR_SIZE = cursor.size;
    GTK_THEME = "Catppuccin-Mocha-Compact-Lavender-Dark";
  };

  gtk = {
    enable = true;
    font  = { 
      name = fonts.sansSerif;
      size = fonts.sizes.applications;
    };

    cursorTheme = {
      package = cursor.package;
      name = cursor.name;
      size = cursor.size;
    };

    theme = {
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        # tweaks = [ "rimless" ];
        variant = "mocha";
      };
      name = "Catppuccin-Mocha-Compact-Mauve-Dark";
    };

    iconTheme = {
      package = icons.package;
      name = icons.name;
    };

  };

  qt = {
    enable = true;
    # platformTheme = "gtk";
    style.package = pkgs.catppuccin-qt5ct;
  };

}