{ pkgs, userConfig, ... }:
let
  sheme = import ./shemes/${userConfig.sheme}.nix;
in
rec {
  inherit sheme;
  # Sheme styling : https://github.com/tinted-theming/base24/blob/master/styling.md
  # Sheme guidlines : https://github.com/tinted-theming/home/blob/main/builder.md#schemes-repository

  scaling = 1.0;

  cursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 22;
  };

  icons = {
    name = "morewaita-icon-theme";
    package = pkgs.morewaita-icon-theme;
  };

  opacity = {
    # TODO : add blur settings
    desktop = 1.0;
    applications = 1.0;
    terminal = 1.0;
    popups = 1.0;
  };

  # TODO : test Lexend one day
  fonts = {
    serif = "Ubuntu Nerd Font"; # ¯\_(ツ)_/¯
    sansSerif = "Ubuntu Nerd Font";
    monospace = "JetBrainsMono Nerd Font";
    emoji = "Noto Color Emoji";

    sizes = rec {
      desktop = 15;
      applications = 12;
      terminal = 9;
      popups = desktop;
    };

    packages = with pkgs; [
      (nerdfonts.override { fonts = [
        "Ubuntu"
        "FiraCode"
        "JetBrainsMono"
        "Iosevka"
      ]; })
      noto-fonts-emoji
    ];
  };

  wallpaper = userConfig.wallpaper;
}
