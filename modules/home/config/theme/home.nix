{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.theme;
  inherit (config) theme;
in {
  config = mkIf cfg.enable {
    home = with theme; {
      packages = [
        fonts.normal.package
        fonts.mono.package
        fonts.emoji.package
        cursor.package
        icons.package

        pkgs.adwaita-icon-theme
        (pkgs.nerdfonts.override {fonts = ["SpaceMono"];})
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

    fonts.fontconfig = with theme; {
      enable = true;
      defaultFonts = {
        emoji = [fonts.emoji.name];
        monospace = [fonts.mono.name];
        serif = [fonts.normal.name];
        sansSerif = [fonts.normal.name];
      };
    };
  };
}
