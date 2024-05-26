{ pkgs, artwork, config, ... }:
with artwork;
{
  imports = [
    ./gtk.nix
    ./qt.nix
  ];

  home = {
    packages =
    [
      fonts.serif.package
      fonts.sansSerif.package
      fonts.monospace.package
      fonts.emoji.package
      cursor.package
      icons.package
      gnome.adwaita-icon-theme
      qt.package
      gtk.package
    ];

    pointerCursor = {
      inherit (cursor) name package size;
      x11.enable = true;
      gtk.enable = true;
    };

    sessionVariables = {
      XCURSOR_THEME = cursor.name;
      XCURSOR_SIZE = cursor.size;
      XCURSOR_PATH = "/usr/share/icons:${config.xdg.dataHome}/icons";
    };
  };

  fonts.fontconfig = { 
    enable = true;
    defaultFonts = {
      emoji = [ fonts.emoji.name ];
      monospace = [ fonts.monospace.name ];
      serif = [ fonts.serif.name ];
      sansSerif = [ fonts.sansSerif.name ];
    };
  };
}
