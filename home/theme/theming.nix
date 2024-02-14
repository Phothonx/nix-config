{ pkgs, ... }:
{

  home.packages = with pkgs; [
    (pkgs.nerdfonts.override { fonts = [
    "Ubuntu"
    "UbuntuMono"
    "CascadiaCode"
    "FiraCode"
    "JetBrainsMono"
    "Iosevka"
    ]; })
  ];

  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = 22;
    GTK_THEME = "Catppuccin-Mocha-Compact-Lavender-Dark";
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 22;
    gtk.enable = true;
    };

  gtk = {
    enable = true;
    font  = { 
      name = "Ubuntu Nerd Font";
      size = 12;
    };

    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 22;
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
      package = pkgs.morewaita-icon-theme;
      name = "morewaita-icon-theme";
    };

  };

  qt = {
    enable = true;
    # platformTheme = "gtk";
    style.package = pkgs.catppuccin-qt5ct;
  };

}