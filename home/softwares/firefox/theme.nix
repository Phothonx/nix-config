{ inputs, ... }:
{
  home.file.".mozilla/firefox/nix-user-profile/chrome/firefox-gnome-theme".source = inputs.firefox-gnome-theme;

  programs.firefox.profiles.default = {
    userChrome = ''
      @import "firefox-gnome-theme/userChrome.css"
    '';
    userContent = ''
      @import "firefox-gnome-theme/userContent.css
    '';
    settings = {
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # Enable customChrome.cs
      "browser.uidensity" = 0; # Set UI density to normal
      "svg.context-properties.content.enabled" = true; # Enable SVG context-propertes
    };
  };
}
