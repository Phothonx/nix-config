{
  config,
  pkgs,
  ...
}: let
  inherit (config) colorScheme icons fontsProfiles cursor;

  extraCss = with colorScheme.base24; ''
    @define-color window_bg_color #${base11};            /* The main background color used on GtkWindow */
    @define-color window_fg_color #${base07};            /* The main foreground text color */

    @define-color view_bg_color #${base00};              /* A secondary background color used in icon views, text fields, etc */
    @define-color view_fg_color #${base07};              /* Secondary foreground text color */

    @define-color accent_bg_color #${base0E};            /* Color to indicate that a widget is important, interactive, or currently active */
    @define-color accent_fg_color #${base11};            /* Color for text over widgets using accent_bg_color */
    @define-color accent_color #${base0E};              /* Mostly used for text labels. Can be the same as accent_bg_color */

    @define-color headerbar_bg_color #${base11};        /* The headerbar background */
    @define-color headerbar_fg_color #${base07};        /* The headerbar foreground text color */
    @define-color headerbar_backdrop_color #${base11};  /* The headerbar backdrop state background */
    @define-color headerbar_border_color #${base11};    /* Currently not used in adw-gtk3 */
    @define-color headerbar_shade_color #${base11};     /* The bottom border of the headerbar */

    @define-color card_bg_color #${base00};             /* The background color of lists */
    @define-color card_fg_color #${base07};             /* The text color on libhandy lists */
    @define-color card_shade_color #${base00};          /* List borders */

    @define-color popover_bg_color #${base10};          /* The background color of popovers and menus */
    @define-color popover_fg_color #${base07};          /* The text color on popovers */

    @define-color dialog_bg_color #${base10};           /* The background color of message dialogs */
    @define-color dialog_fg_color #${base07};           /* The foreground color of message dialogs */

    @define-color sidebar_bg_color #${base11};          /* Sidebar background color */
    @define-color sidebar_fg_color #${base07};          /* Sidebar foreground color */
    @define-color sidebar_backdrop_color #${base11};    /* Sidebar backdrop background color */
    @define-color sidebar_shade_color #${base11};       /* Sidebar shade color */

    @define-color warning_bg_color #${base0A};          /* Background for widgets and elements that show a warning */
    @define-color warning_fg_color #${base11};          /* Foreground for widgets and elements that show a warning */
    @define-color warning_color #${base0A};             /* Warning text label */

    @define-color error_bg_color #${base08};            /* Background for widgets and elements that show an error */
    @define-color error_fg_color #${base11};            /* Foreground for widgets and elements that show an error */
    @define-color error_color #${base08};               /* Error text label */

    @define-color success_bg_color #${base0D};          /* Background for widgets and elements that show a successful action */
    @define-color success_fg_color #${base11};          /* Foreground for widgets and elements that show a successful action */
    @define-color success_color #${base0D};             /* Success text label */

    @define-color destructive_bg_color #${base0F};      /* The destructive color indicates a dangerous action, such as deleting a file */
    @define-color destructive_fg_color #${base11};      /* Destructive foreground color */
    @define-color destructive_color #${base0F};         /* Destructive text label */
  '';
in {
  home.sessionVariables = {
    GTK_THEME = "adw-gtk3";
    GTK_USE_PORTAL = "1";
    GDK_BACKEND = "wayland";
  };

  gtk = {
    enable = true;
    cursorTheme = cursor;
    iconTheme = icons;
    font = {
      inherit (fontsProfiles.regular) name package;
      size = fontsProfiles.sizes.applications;
    };
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3";
    };

    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      extraConfig = ''
      '';
    };

    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
        gtk-overlay-scrolling = false;
        gtk-enable-primary-paste = false;
        gtk-error-bell = false;
        gtk-enable-input-feedback-sounds = false;
        gtk-decoration-layout = "appmenu:none";
        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintslight";
        gtk-xft-rgba = "rgb";
      };
      inherit extraCss;
    };

    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
        gtk-overlay-scrolling = false;
        gtk-enable-primary-paste = false;
        gtk-error-bell = false;
        gtk-enable-input-feedback-sounds = false;
        gtk-decoration-layout = "appmenu:none";
        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintslight";
        gtk-xft-rgba = "rgb";
      };
      inherit extraCss;
    };
  };
}
