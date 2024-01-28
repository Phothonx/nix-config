{ pkgs, inputs, ... }:
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
      };

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        bitwarden
        ublock-origin
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