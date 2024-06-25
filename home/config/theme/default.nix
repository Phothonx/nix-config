{ pkgs, artwork, config, ... }:
with artwork;
{
  imports = [
    ./gtk.nix
    ./qt.nix
  ];

  home = {
    packages = [
      fonts.normal.package
      fonts.mono.package
      fonts.emoji.package
      cursor.package
      icons.package

      pkgs.gnome.adwaita-icon-theme
      (pkgs.nerdfonts.override { fonts = [ "SpaceMono" ]; })
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
      monospace = [ fonts.mono.name ];
      serif = [ fonts.normal.name ];
      sansSerif = [ fonts.normal.name ];
    };
  };
}
