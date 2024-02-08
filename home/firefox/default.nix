{ pkgs, inputs, ... }:
let
  firefoxModBlur = pkgs.fetchgit {
    url = "";
    sparseCheckout = [
      "userChrome.css"
      "userContent.css"
      "EXTRA MODS"
      "ASSETS"
    ];
    postFetch = ''
    
    '';
    hash = "";
  };
in
{
  home.sessionVariables.BROWSER = "firefox";

  programs.firefox = {
    enable = true;
    
    profiles.default = {
      isDefault = true;

      search.default = "Google";

      search.engines = {
        "Nix Packages" = {
          urls = [{
            template = "https://search.nixos.org/packages";
            params = [
              { name = "type"; value = "packages"; }
              { name = "query"; value = "{searchTerms}"; }
            ];
          }];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };
      };

      settings = {
        "browser.download.panel.shown" = true;
        "identity.fxaccounts.enabled" = false;
        "signon.rememberSignons" = false;
        
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        "app.shield.optoutstudies.enabled" = false;
        "app.update.auto" = false;
        "browser.bookmarks.restore_default_bookmarks" = false;
        "browser.contentblocking.category" = "strict";
        "browser.ctrlTab.recentlyUsedOrder" = false;
        "browser.discovery.enabled" = false;
        "browser.laterrun.enabled" = false;

        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "datareporting.policy.dataSubmissionEnable" = false;
        "datareporting.policy.dataSubmissionPolicyAcceptedVersion" = 2;
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_ever_enabled" = true;
        "extensions.pocket.enabled" = false;

        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;

        /******
        *    name: arkenfox user.js
        *    date: 5 February 2024
        * version: 122
        *    urls: https://github.com/arkenfox/user.js [repo]
        *        : https://arkenfox.github.io/gui/ [interactive]
        * license: MIT: https://github.com/arkenfox/user.js/blob/master/LICENSE.txt
        ******/
        
        /* 0000: disable about:config warning ***/
        "browser.aboutConfig.showWarning" = false;

        /*** [SECTION 0100]: STARTUP ***/
        "_user.js.parrot" = "0100 syntax error: the parrot's dead!";
        "browser.startup.page" = 3; /* 0102: set startup page ***/
        "browser.newtabpage.enabled" = true; /* 0104: set NEWTAB page ***/
        "browser.newtabpage.activity-stream.showSponsored" = false; /* 0105: disable sponsored content on Firefox Home (Activity Stream) ***/
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.default.sites" = ""; /* 0106: clear default topsites ***/

        /*** [SECTION 0200]: GEOLOCATION ***/
        "_user.js.parrot" = "0200 syntax error: the parrot's definitely deceased!";
        "geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%"; /* 0201: use Mozilla geolocation service instead of Google if permission is granted [FF74+] ***/
        "geo.provider.use_gpsd" = false; /* 0202: disable using the OS's geolocation service ***/

        /*** [SECTION 0300]: QUIETER FOX ***/
        "_user.js.parrot" = "0300 syntax error: the parrot's not pinin' for the fjords!";
        "extensions.getAddons.showPane" = false; /* 0320: disable recommendation pane in about:addons (uses Google Analytics) ***/
        "extensions.htmlaboutaddons.recommendations.enabled" = false; /* 0321: disable recommendations in about:addons' Extensions and Themes panes [FF68+] ***/
        "browser.discovery.enabled" = false; /* 0322: disable personalized Extension Recommendations in about:addons and AMO [FF65+] ***/
        "browser.shopping.experience2023.enabled" = false; /* 0323: disable shopping experience [FF116+] ***/
        /** TELEMETRY ***/
        "datareporting.policy.dataSubmissionEnabled" = false; /* 0330: disable new data submission [FF41+] ***/
        "datareporting.healthreport.uploadEnabled" = false; /* 0331: disable Health Reports ***/
        "toolkit.telemetry.unified" = false; /* 0332: disable telemetry ***/
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.server" = "data:,";
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true; /* 0333: disable Telemetry Coverage ***/
        "toolkit.coverage.opt-out" = true;
        "toolkit.coverage.endpoint.base" = "";
        "browser.ping-centre.telemetry" = false; /* 0334: disable PingCentre telemetry (used in several System Add-ons) [FF57+] ***/
        "browser.newtabpage.activity-stream.feeds.telemetry" = false; /* 0335: disable Firefox Home (Activity Stream) telemetry ***/
        "browser.newtabpage.activity-stream.telemetry" = false;
        /** STUDIES ***/
        "app.shield.optoutstudies.enabled" = false; /* 0340: disable Studies ***/
        "app.normandy.enabled" = false; /* 0341: disable Normandy/Shield [FF60+] ***/
        "app.normandy.api_url" = "";
        /** CRASH REPORTS ***/
        "breakpad.reportURL" = ""; /* 0350: disable Crash Reports ***/
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.crashReports.unsubmittedCheck.autoSubmit2" = false; /* 0351: enforce no submission of backlogged Crash Reports [FF58+] ***/
        /** OTHER ***/
        "captivedetect.canonicalURL" = ""; /* 0360: disable Captive Portal detection ***/
        "network.captive-portal-service.enabled" = false;
        "network.connectivity-service.enabled" = false; /* 0361: disable Network Connectivity checks [FF65+] ***/

        /*** [SECTION 0400]: SAFE BROWSING (SB) ***/
        "_user.js.parrot" = "0400 syntax error: the parrot's passed on!";

        /*** [SECTION 0600]: BLOCK IMPLICIT OUTBOUND [not explicitly asked for - e.g. clicked on] ***/
        "_user.js.parrot" = "0600 syntax error: the parrot's no more!";

        /*** [SECTION 0700]: DNS / DoH / PROXY / SOCKS ***/
        "_user.js.parrot" = "0700 syntax error: the parrot's given up the ghost!";
      };

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        bitwarden
        ublock-origin
        skip-redirect
      ];
    };
  };

  home.file."./.mozilla/firefox/default/chrome" = {
    recursive = true;
    source = pkgs.fetchgit {
      url = "https://github.com/datguypiko/Firefox-Mod-Blur";
      sparseCheckout = [
        "userChrome.css"
        "userContent.css"
        "ASSETS/*"
        "EXTRA MODS/Bookmarks Bar Mods/Popout bookmarks bar/popout_bookmarks_bar_on_hover.css"
        "EXTRA MODS/Tabs Bar Mods/Tabs - selected tabs static width/selected_tabs_static_width.css"
        "EXTRA MODS/Tabs Bar Mods/Colored sound playing tab/colored_soundplaying_tab.css"
        "EXTRA MODS/Search Bar Mods/Search box - No search engine buttons/no_search_engines_in_url_bar.css"
        "EXTRA MODS/Search Bar Mods/Search box - dots show only on hover/show_searchbar_dots_only_on_hover.css"
        "EXTRA MODS/Tabs Bar Mods/Tabs - selected tabs static width/selected_tabs_static_width.css"
        "EXTRA MODS/Tabs Bar Mods/Tabs - separator/tabs_separator.css"
        "EXTRA MODS/Compact extensions menu/Style 1/cleaner_extensions_menu.css"
      ];

      postFetch = ''
        cp $out/EXTRA\ MODS/Bookmarks\ Bar\ Mods/Popout\ bookmarks\ bar/popout_bookmarks_bar_on_hover.css $out
        cp $out/EXTRA\ MODS/Tabs\ Bar\ Mods/Tabs\ -\ selected\ tabs\ static\ width/selected_tabs_static_width.css $out
        cp $out/EXTRA\ MODS/Tabs\ Bar\ Mods/Colored\ sound\ playing\ tab/colored_soundplaying_tab.css $out
        cp $out/EXTRA\ MODS/Search\ Bar\ Mods/Search\ box\ -\ No\ search\ engine\ buttons/no_search_engines_in_url_bar.css $out
        cp $out/EXTRA\ MODS/Search\ Bar\ Mods/Search\ box\ -\ dots\ show\ only\ on\ hover/show_searchbar_dots_only_on_hover.css $out
        cp $out/EXTRA\ MODS/Tabs\ Bar\ Mods/Tabs\ -\ separator/tabs_separator.css $out
        cp $out/EXTRA\ MODS/Compact\ extensions\ menu/Style\ 1/cleaner_extensions_menu.css $out
      ''; # DON'T TALK ABOUT THIS TO ANYONE

      hash = "sha256-n9eBbWJwUmzJnvBkmjlIxhSfKgxxwC8XiLdTqFvMMIY=";
  };
 
  };
}