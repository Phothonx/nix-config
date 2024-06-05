{ ... }:
{
  programs.firefox.profiles.default.settings = {
    "browser.download.panel.shown" = true;
    "identity.fxaccounts.enabled" = false;
    
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

    "app.update.auto" = false;

    "browser.bookmarks.restore_default_bookmarks" = false;
    "browser.contentblocking.category" = "strict";
    "browser.ctrlTab.recentlyUsedOrder" = false;
    "browser.laterrun.enabled" = false;

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
    # "_user.js.parrot" = "START: Oh yes, the Norwegian Blue... what's wrong with it?";
    
    /* 0000: disable about:config warning ***/
    "browser.aboutConfig.showWarning" = false;

    /*** [SECTION 0100]: STARTUP ***/
    # "_user.js.parrot" = "0100 syntax error: the parrot's dead!";
    "browser.startup.page" = 3; /* 0102: set startup page ***/
    "browser.newtabpage.activity-stream.showSponsored" = false; /* 0105: disable sponsored content on Firefox Home (Activity Stream) ***/
    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
    "browser.newtabpage.activity-stream.default.sites" = ""; /* 0106: clear default topsites ***/

    /*** [SECTION 0200]: GEOLOCATION ***/
    # "_user.js.parrot" = "0200 syntax error: the parrot's definitely deceased!";
    "geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%"; /* 0201: use Mozilla geolocation service instead of Google if permission is granted [FF74+] ***/
    "geo.provider.use_gpsd" = false; /* 0202: disable using the OS's geolocation service ***/

    /*** [SECTION 0300]: QUIETER FOX ***/
    # "_user.js.parrot" = "0300 syntax error: the parrot's not pinin' for the fjords!";
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
    # "_user.js.parrot" = "0400 syntax error: the parrot's passed on!";

    /*** [SECTION 0600]: BLOCK IMPLICIT OUTBOUND [not explicitly asked for - e.g. clicked on] ***/
    # "_user.js.parrot" = "0600 syntax error: the parrot's no more!";
    "network.prefetch-next" = false; /* 0601: disable link prefetching ***/
    "network.dns.disablePrefetch" = true; /* 0602: disable DNS prefetching ***/
    "network.predictor.enabled" =  false; /* 0603: disable predictor / prefetching ***/
    "network.predictor.enable-prefetch" = false;
    "network.http.speculative-parallel-limit" = 0; /* 0604: disable link-mouseover opening connection to linked server ***/
    "browser.places.speculativeConnect.enabled" = false; /* 0605: disable mousedown speculative connections on bookmarks and history [FF98+] ***/

    /*** [SECTION 0700]: DNS / DoH / PROXY / SOCKS ***/
    # "_user.js.parrot" = "0700 syntax error: the parrot's given up the ghost!";
    "network.proxy.socks_remote_dns" = true; /* 0702: set the proxy server to do any DNS lookups when using SOCKS ***/
    "network.file.disable_unc_paths" = true; /* 0703: disable using UNC (Uniform Naming Convention) paths [FF61+] ***/
    "network.gio.supported-protocols" = ""; /* 0704: disable GIO as a potential proxy bypass vector ***/
    # "network.trr.mode" = 3; /* 0710: enable DNS-over-HTTPS (DoH) [FF60+] ***/
    # "network.trr.custom_uri" = "https://example.dns"; /* 0712: set DoH provider ***/

    /*** [SECTION 0800]: LOCATION BAR / SEARCH BAR / SUGGESTIONS / HISTORY / FORMS ***/
    # "_user.js.parrot" = "0800 syntax error: the parrot's ceased to be!";
    "browser.urlbar.suggest.quicksuggest.sponsored" = false;

    /*** [SECTION 0900]: PASSWORDS ***/
    # "_user.js.parrot" = "0900 syntax error: the parrot's expired!";
    "signon.autofillForms" = false; /* 0903: disable auto-filling username & password form fields ***/
    "signon.formlessCapture.enabled" = false; /* 0904: disable formless login capture for Password Manager [FF51+] ***/
    "network.auth.subresource-http-auth-allow" = 1; /* 0905: limit (or disable) HTTP authentication credentials dialogs triggered by sub-resources [FF41+] ***/

    /*** [SECTION 1000]: DISK AVOIDANCE ***/
    # "_user.js.parrot" = "1000 syntax error: the parrot's gone to meet 'is maker!";
    "browser.privatebrowsing.forceMediaMemoryCache" = true; /* 1002: disable media cache from writing to disk in Private Browsing ***/
    "media.memory_cache_max_size" = 65536;
    "browser.sessionstore.privacy_level" = 2; /* 1003: disable storing extra session data [SETUP-CHROME] ***/

    /*** [SECTION 1200]: HTTPS (SSL/TLS / OCSP / CERTS / HPKP) ***/
    # "_user.js.parrot" = "1200 syntax error: the parrot's a stiff!";
    "security.ssl.require_safe_negotiation" = true; /* 1201: require safe negotiation ***/
    "security.tls.enable_0rtt_data" = false; /* 1206: disable TLS1.3 0-RTT (round-trip time) [FF51+] ***/
    "security.OCSP.enabled" = 1; /* 1211: enforce OCSP fetching to confirm current validity of certificates ***/
    "security.OCSP.require" = true;
    "security.cert_pinning.enforcement_level" = 2;
    "security.remote_settings.crlite_filters.enabled" = true;
    "security.pki.crlite_mode" = 2;
    /** MIXED CONTENT ***/
    "dom.security.https_only_mode" = true;
    "dom.security.https_only_mode_send_http_background_request" = false;
    /** UI (User Interface) ***/
    "security.ssl.treat_unsafe_negotiation_as_broken" = true;
    "browser.xul.error_pages.expert_bad_cert" = true;

    /*** [SECTION 1600]: REFERERS ***/
    # "_user.js.parrot" = "1600 syntax error: the parrot rests in peace!";
    "network.http.referer.XOriginTrimmingPolicy" = 2;

    /*** [SECTION 1700]: CONTAINERS ***/
    # "_user.js.parrot" = "1700 syntax error: the parrot's bit the dust!";
    "privacy.userContext.enabled" = true;
    "privacy.userContext.ui.enabled" = true;

    /*** [SECTION 2000]: PLUGINS / MEDIA / WEBRTC ***/
    # "_user.js.parrot" = "2000 syntax error: the parrot's snuffed it!";
    "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
    "media.peerconnection.ice.default_address_only" = true;

    /*** [SECTION 2400]: DOM (DOCUMENT OBJECT MODEL) ***/
    # "_user.js.parrot" = "2400 syntax error: the parrot's kicked the bucket!";
    "dom.disable_window_move_resize" = true;

    /*** [SECTION 2600]: MISCELLANEOUS ***/
    # "_user.js.parrot" = "2600 syntax error: the parrot's run down the curtain!";
    "browser.download.start_downloads_in_tmp_dir" = true;
    "browser.helperApps.deleteTempFileOnExit" = true;
    "browser.uitour.enabled" = false;
    "devtools.debugger.remote-enabled" = false;
    "permissions.manager.defaultsUrl" = "";
    "webchannel.allowObject.urlWhitelist" = "";
    "network.IDN_show_punycode" = true;
    "browser.tabs.searchclipboardfor.middleclick" = false;
    /** DOWNLOADS ***/
    "browser.download.useDownloadDir" = false;
    "browser.download.alwaysOpenPanel" = false;
    "browser.download.manager.addToRecentDocs" = false;
    "browser.download.always_ask_before_handling_new_types" = true;
    /** EXTENSIONS ***/
    "extensions.enabledScopes" = 8;
    "extensions.postDownloadThirdPartyPrompt" = false;

    /*** [SECTION 2700]: ETP (ENHANCED TRACKING PROTECTION) ***/
    # "_user.js.parrot" = "2700 syntax error: the parrot's joined the bleedin' choir invisible!";

    /*** [SECTION 2800]: SHUTDOWN & SANITIZING ***/
    # "_user.js.parrot" = "2800 syntax error: the parrot's bleedin' demised!";
    "privacy.sanitize.sanitizeOnShutdown" = true;
    /** SANITIZE ON SHUTDOWN: IGNORES "ALLOW" SITE EXCEPTIONS ***/
    "privacy.clearOnShutdown.cache" = true;
    "privacy.clearOnShutdown.downloads" = false;
    "privacy.clearOnShutdown.formdata" = true; 
    "privacy.clearOnShutdown.history" = false;  
    "privacy.clearOnShutdown.sessions" = false; 
    /** SANITIZE ON SHUTDOWN: RESPECTS "ALLOW" SITE EXCEPTIONS FF103+ ***/
    /** SANITIZE MANUAL: IGNORES "ALLOW" SITE EXCEPTIONS ***/

    /*** [SECTION 4000]: FPP (fingerprintingProtection) ***/
    # "_user.js.parrot" = "1400 syntax error: the parrot's bereft of life!";

    /*** [SECTION 4500]: RFP (resistFingerprinting) ***/

    /*** [SECTION 5000]: OPTIONAL OPSEC ***/
    # "_user.js.parrot" = "5000 syntax error: the parrot's taken 'is last bow";
    "signon.rememberSignons" = false;
    "extensions.formautofill.addresses.enabled" = false;
    "extensions.formautofill.creditCards.enabled" = false;

    /*** [SECTION 5500]: OPTIONAL HARDENING ***/
    # "_user.js.parrot" = "5500 syntax error: this is an ex-parrot!";

    /*** [SECTION 6000]: DON'T TOUCH ***/
    # "_user.js.parrot" = "6000 syntax error: the parrot's 'istory!";

    /*** [SECTION 7000]: DON'T BOTHER ***/
    # "_user.js.parrot" = "7000 syntax error: the parrot's pushing up daisies!";

    /*** [SECTION 8000]: DON'T BOTHER: FINGERPRINTING ***/
    # "_user.js.parrot" = "8000 syntax error: the parrot's crossed the Jordan";

    /*** [SECTION 9000]: NON-PROJECT RELATED ***/
    # "_user.js.parrot" = "9000 syntax error: the parrot's cashed in 'is chips!";
    "browser.startup.homepage_override.mstone" = "ignore";
    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
    "browser.messaging-system.whatsNewPanel.enabled" = false;

    /*** [SECTION 9999]: DEPRECATED / RENAMED ***/
    # "_user.js.parrot" = "9999 syntax error: the parrot's shuffled off 'is mortal coil!";

    /* END: internal custom pref to test for syntax errors ***/
    # "_user.js.parrot" = "SUCCESS: No no he's not dead, he's, he's restin'!";
  };
}
