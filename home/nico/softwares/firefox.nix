{pkgs, ...}: {
  programs.firefox = {
    enable = true;

    policies = {}; # https://mozilla.github.io/policy-templates/

    profiles.default = {
      id = 0;
      isDefault = true;
      name = "default";

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        ublock-origin
        skip-redirect
        vimium
      ];

      settings = {
        # user.js
        # Speed ?
        "browser.cache.disk.enable" = true;
        "network.dnsCacheExpiration" = 3600; # keep entries for 1 hour

        # Settings (stolen from someone...)

        "app.shield.optoutstudies.enabled" = false;
        "app.update.auto" = false;

        "breakpad.reportURL" = "";

        "browser.startup.page" = 3; # restore prev session
        "browser.startup.homepage" = "/home/nico/vimwiki/site_html/index.html";

        "browser.tabs.crashReporting.sendReport" = false;
        "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
        "browser.bookmarks.restore_default_bookmarks" = false;
        "browser.contentblocking.category" = "strict";
        "browser.ctrlTab.recentlyUsedOrder" = false;
        "browser.discovery.enabled" = false;
        "browser.laterrun.enabled" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;
        "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned" = "";
        "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines" = "";
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.pinned" = false;
        "browser.newtabpage.enabled" = false; # false = blank new tab page
        "browser.protections_panel.infoMessage.seen" = true;
        "browser.quitShortcut.disabled" = true;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.ssb.enabled" = true;
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.urlbar.placeholderName" = "";
        "browser.urlbar.suggest.openpage" = false;
        "browser.download.start_downloads_in_tmp_dir" = true;
        "browser.helperApps.deleteTempFileOnExit" = true;
        "browser.formfill.enable" = false;
        "browser.aboutConfig.showWarning" = false;
        "browser.compactmode.show" = true;
        "browser.translations.enable" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.search.suggest.enabled" = false;

        "signon.rememberSignons" = false;
        "signon.formlessCapture.enabled" = false;
        "signon.privateBrowsingCapture.enabled" = false;
        "editor.truncate_user_pastes" = false;

        "network.auth.subresource-http-auth-allow" = 1;

        "datareporting.policy.dataSubmissionEnable" = false;
        "datareporting.policy.dataSubmissionPolicyAcceptedVersion" = 2;
        "datareporting.healthreport.uploadEnabled" = false;

        "toolkit.telemetry.archive.enabled" = false;

        "dom.security.https_only_mode" = true;
        "dom.security.https_first" = true;
        "dom.security.https_only_mode_ever_enabled" = true;

        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "extensions.pocket.enabled" = false;
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;
        "extensions.autoDisableScopes" = 0; # enable extension by def
        "extensions.webextensions.allowPrivateBrowsingByDefault" = true;
        "extensions.webextensions.restrictedDomains" = ""; # disable webextension restrictions on certain mozilla domains

        "identity.fxaccounts.enabled" = false;

        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.resistFingerprinting.block_mozAddonManager" = true; # To allow extensions to work on AMO
      };

      search = {
        force = true; # allow hm to override search config, prevent fail
        default = "SearchXNG";
        engines = {
          "bing".metaData.hidden = true;
          "google".metaData.alias = "@g";
          "nix Packages" = {
            urls = [
              {template = "https://search.nixos.org/packages?type=packages&channel=unstable&query={searchTerms}";}
            ];
            definedAliases = ["@np" "@nixpkgs"];
          };
          "home-manager Options" = {
            urls = [
              {template = "https://home-manager-options.extranix.com/?query={searchTerms}&release=master";}
            ];
            definedAliases = ["@hm" "@homeoptions"];
          };
          "Nix package versions" = {
            urls = [
              {template = "https://lazamar.co.uk/nix-versions/?channel=nixpkgs-unstable&package={searchTerms}";}
            ];
            definedAliases = ["@nv"];
          };
          "youTube" = {
            urls = [
              {template = "https://www.youtube.com/results?search_query={searchTerms}";}
            ];
            definedAliases = ["@yt" "@youtube"];
          };
        };
      };
    };
  };
}
