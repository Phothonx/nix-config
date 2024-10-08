{
  config,
  lib,
  inputs,
  ...
}:
with lib; let
  cfg = config.programs.firefox.theme;
in {
  options.programs.firefox.theme = {
    enable = mkEnableOption "Use firefox custom css & startpage";
  };

  config = mkIf cfg.enable {
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
  };
}
