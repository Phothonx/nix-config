{ colors, inputs, ... }:
{ 
  home.file.".mozilla/firefox/default/chrome/MiniFox".source = inputs.MiniFox;

  # Startpage from https://gitlab.com/fazzi/startpage
  home.file.".mozilla/firefox/default/startpage" = {
    recursive = true;
    source = ./startpage;
  };

  programs.firefox.profiles.default = {
    userChrome = ''
      @import "MiniFox/chrome/userChrome.css"
    '';
    userContent = ''
    '';
    settings = {
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "browser.uidensity" = 1;
      "svg.context-properties.content.enabled" = true;
      "browser.urlbar.suggest.calculator" = true;
      # Theme options 
      "uc.tweak.no-window-controls" = true;
    };
  };
}
