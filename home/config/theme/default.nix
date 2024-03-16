{ pkgs, theme, config, ... }:
with theme;
{
  imports = [
    ./gtk.nix
    ./qt.nix
  ];

  home = {
    packages = fonts.packages ++ [ cursor.package ] ++ [ icons.package ];

    pointerCursor = cursor;

    sessionVariables = {
      XCURSOR_THEME = cursor.name;
      XCURSOR_SIZE = cursor.size;
    };
  };
}
