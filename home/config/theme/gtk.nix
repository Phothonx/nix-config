{ artwork, config, pkgs, ... }:
with artwork;
{
  home.sessionVariables = {
    GTK_THEME = "Catppuccin-Mocha-Compact-Mauve-Dark";
    GDK_BACKEND = "wayland";
	  GTK_USE_PORTAL = "1";
  };

  gtk = {
    enable = true;

    cursorTheme = cursor;
    iconTheme = icons;
    theme = {
      name = "Catppuccin-Mocha-Compact-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact"; # "standard" "compact"
        #tweaks = [ "rimless" ]; # "black" "rimless" "normal" 
        variant = "mocha";
      };
    };
    font  = { 
      inherit (fonts.normal) name package;
      size = fonts.sizes.applications;
    };

    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      extraConfig = ''
        gtk-xft-antialias=1
        gtk-xft-hinting=1
        gtk-xft-hintstyle="hintslight"
        gtk-xft-rgba="rgb"
      '';
    };

    gtk3.extraConfig = {
      gtk-toolbar-style = "GTK_TOOLBAR_BOTH";
      gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
      gtk-decoration-layout = "appmenu:none";
      gtk-button-images = 1;
      gtk-menu-images = 1;
      gtk-enable-event-sounds = 0;
      gtk-enable-input-feedback-sounds = 0;
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
      gtk-error-bell = 0;
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-decoration-layout = "appmenu:none";
      gtk-enable-event-sounds = 0;
      gtk-enable-input-feedback-sounds = 0;
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-error-bell = 0;
      gtk-application-prefer-dark-theme = true;
    };
  };
}
