{ pkgs, inputs, config, ... }:
{

  programs.firefox = {
    enable = true;

    policies = { # mostly overwritten by nix and the user.js in ./settings.nix
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      OfferToSaveLogins = false;
      FirefoxHome = {
        Search = false;
        Pocket = false;
        Snippets = false;
        Highlights = false;
        TopSites = true;
      };
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DefaultDownloadDirectory = "\${home}/Downloads";
      OfferToSaveLoginsDefault = false;
      PromptForDownloadLocation = true;
      SearchSuggestEnabled = false;
      TranslateEnabled = false;
      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
        Locked = false;
      };
      UserMessaging = {
        ExtensionRecommendations = false;
        SkipOnboarding = true;
      };
      SearchBar = "unified";
      PasswordManagerEnabled = false;
      NoDefaultBookmarks = true;
      DontCheckDefaultBrowser = true;
      DisableSetDesktopBackground = true;
      DisableSystemAddonUpdate = true;
      ExtensionUpdate = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      DisableFeedbackCommands = true;
      SearchEngines.Default = "Google";
      BlockAboutAddons = true;
      DisableFormHistory = true;
      AppAutoUpdate = false;
      DisableAppUpdate = true;
    };
    
    profiles.default = {
      id = 0;
      isDefault = true;
      name = "default";

            
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        bitwarden
        ublock-origin
        skip-redirect
        sponsorblock
        localcdn
      ]; 

      search = {
        default = "Google";
        order = [ "Google" ];
        force = true;
        engines = {
        "Bing".metaData.hidden = true;
        "Google".metaData.alias = "@g";
        "Nix Packages" = {
          urls = [{
            template = "https://search.nixos.org/packages";
            params = [
              { name = "type"; value = "packages"; }
              { name = "channel"; value = "unstable"; }
              { name = "query"; value = "{searchTerms}"; }
            ];
          }];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };
        "Home-manager Options" = {
          urls = [{
            template = "https://home-manager-options.extranix.com";
            params = [
              { name = "release"; value = "master"; }
              { name = "query"; value = "{searchTerms}"; }
            ];
          }];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@hm" ];
        };
        "NixOS Wiki" = {
          urls = [{ template = "https://wiki.nixos.org/index.php?search={searchTerms}"; }];
          iconUpdateURL = "https://wiki.nixos.org/favicon.png";
          updateInterval = 24 * 60 * 60 * 1000; # every day
          definedAliases = [ "@nw" ];
          };
        };
      };
    };
  };

  home.file."./.mozilla/firefox/default/chrome" = {
    recursive = true;
    source = ./chrome;
  };
}
