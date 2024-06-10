{ ... }:
{
  programs.firefox.policies = { # mostly overwritten by nix and the user.js in ./user.nix
    # More at https://mozilla.github.io/policy-templates/ 
    DisableFirefoxStudies = true;
    DisablePocket = true;
    DisableTelemetry = true;
    OfferToSaveLogins = false;
    FirefoxHome = {
      Search = false;
      SponsoredTopSites = false;
      Pocket = false;
      SponsoredPocket = false;
      Snippets = false;
      Highlights = false;
      TopSites = true;
      Locked = true;
    };
    Homepage = {
      StartPage = "previous-session";
      Locked = true;
    };
    DisableMasterPasswordCreation = false;
    DisableProfileImport = true;
    Cookies = {
      Behavior = "reject-tracker-and-partition-foreign";
      Locked = true;
    };
    AutofillAddressEnabled = false;
    AutofillCreditCardEnabled = false;
    DefaultDownloadDirectory = "\${home}/Downloads";
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
      Locked = true;
      WhatsNew = false;
      FeatureRecommendations = false;
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
      EmailTracking = true;
      Fingerprinting = true;
    };

    DisableFeedbackCommands = true;
    # SearchEngines.Default = "Google";
    BlockAboutAddons = true;
    DisableFormHistory = true;
    AppAutoUpdate = false;
    DisableAppUpdate = true;
  };
}
