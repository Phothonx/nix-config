{ inputs, ... }:
{
  home.file.".mozilla/firefox/default/chrome/firefox-gnome-theme".source = inputs.firefox-gnome-theme;

  programs.firefox.profiles.default = {
    userChrome = ''
      @import "firefox-gnome-theme/userChrome.css"
    '';
    userContent = ''
      @import "firefox-gnome-theme/userContent.css
    '';
    settings = {
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "browser.uidensity" = 1;
      "svg.context-properties.content.enabled" = true;
      # Theme options 
      "gnomeTheme.bookmarksToolbarUnderTabs" = true;
      "gnomeTheme.activeTabContrast" = true;
    };
  };
}
