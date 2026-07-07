//
/* You may copy+paste this file and use it as it is.
 *
 * If you make changes to your about:config while the program is running, the
 * changes will be overwritten by the user.js when the application restarts.
 *
 * To make lasting changes to preferences, you will have to edit the user.js.
 */

/****************************************************************************
 * Betterfox                                                                *
 * "Ad meliora"                                                             *
 * version: 149                                                             *
 * url: https://github.com/yokoffing/Betterfox                              *
****************************************************************************/

/****************************************************************************
 * SECTION: FASTFOX                                                         *
****************************************************************************/
lockPref("gfx.canvas.accelerated.cache-size", 256); // reset pref

/****************************************************************************
 * SECTION: SECUREFOX                                                       *
****************************************************************************/
/** TRACKING PROTECTION ***/
lockPref("browser.contentblocking.category", "strict");
lockPref("browser.download.start_downloads_in_tmp_dir", true);
lockPref("browser.uitour.enabled", false);
lockPref("privacy.globalprivacycontrol.enabled", true);

/** OCSP & CERTS / HPKP ***/
lockPref("security.OCSP.enabled", 0);
lockPref("privacy.antitracking.isolateContentScriptResources", true);
lockPref("security.csp.reporting.enabled", false);

/** SSL / TLS ***/
lockPref("security.ssl.treat_unsafe_negotiation_as_broken", true);
lockPref("browser.xul.error_pages.expert_bad_cert", true);
lockPref("security.tls.enable_0rtt_data", false);

/** DISK AVOIDANCE ***/
// lockPref("browser.cache.disk.enable", false);
lockPref("browser.privatebrowsing.forceMediaMemoryCache", true);
lockPref("media.memory_cache_max_size", 65536);
lockPref("browser.sessionstore.interval", 60000);

/** SHUTDOWN & SANITIZING ***/
lockPref("privacy.history.custom", true);
lockPref("browser.privatebrowsing.resetPBM.enabled", true);

/** SPECULATIVE LOADING ***/
lockPref("network.http.speculative-parallel-limit", 0);
lockPref("network.dns.disablePrefetch", true);
lockPref("network.dns.disablePrefetchFromHTTPS", true);
lockPref("browser.urlbar.speculativeConnect.enabled", false);
lockPref("browser.places.speculativeConnect.enabled", false);
lockPref("network.prefetch-next", false);

/** SEARCH / URL BAR ***/
lockPref("browser.urlbar.trimHttps", true);
lockPref("browser.urlbar.untrimOnUserInteraction.featureGate", true);
lockPref("browser.search.separatePrivateDefault.ui.enabled", true);
lockPref("browser.search.suggest.enabled", false);
lockPref("browser.urlbar.quicksuggest.enabled", false);
lockPref("browser.urlbar.groupLabels.enabled", false);
lockPref("browser.formfill.enable", false);
lockPref("network.IDN_show_punycode", true);

/** HTTPS-ONLY MODE ***/
lockPref("dom.security.https_only_mode", true);
lockPref("dom.security.https_only_mode_error_page_user_suggestions", true);

/** PASSWORDS ***/
lockPref("signon.formlessCapture.enabled", false);
lockPref("signon.privateBrowsingCapture.enabled", false);
lockPref("network.auth.subresource-http-auth-allow", 1);
lockPref("editor.truncate_user_pastes", false);

/** EXTENSIONS ***/
lockPref("extensions.enabledScopes", 5);
lockPref("ui.systemUsesDarkTheme", 1);
/** HEADERS / REFERERS ***/
lockPref("network.http.referer.XOriginTrimmingPolicy", 2);

/** CONTAINERS ***/
lockPref("privacy.userContext.ui.enabled", true);

/** VARIOUS ***/
lockPref("pdfjs.enableScripting", false);

/** SAFE BROWSING ***/
lockPref("browser.safebrowsing.downloads.remote.enabled", false);

/** MOZILLA ***/
lockPref("permissions.default.desktop-notification", 2);
lockPref("permissions.default.geo", 2);
lockPref("geo.provider.network.url", "https://beacondb.net/v1/geolocate");
lockPref("browser.search.update", false);
lockPref("permissions.manager.defaultsUrl", "");
lockPref("extensions.getAddons.cache.enabled", false);

/** TELEMETRY ***/
lockPref("datareporting.policy.dataSubmissionEnabled", false);
lockPref("datareporting.healthreport.uploadEnabled", false);
lockPref("toolkit.telemetry.unified", false);
lockPref("toolkit.telemetry.enabled", false);
lockPref("toolkit.telemetry.server", "data:,");
lockPref("toolkit.telemetry.archive.enabled", false);
lockPref("toolkit.telemetry.newProfilePing.enabled", false);
lockPref("toolkit.telemetry.shutdownPingSender.enabled", false);
lockPref("toolkit.telemetry.updatePing.enabled", false);
lockPref("toolkit.telemetry.bhrPing.enabled", false);
lockPref("toolkit.telemetry.firstShutdownPing.enabled", false);
lockPref("toolkit.telemetry.coverage.opt-out", true);
lockPref("toolkit.coverage.opt-out", true);
lockPref("toolkit.coverage.endpoint.base", "");
lockPref("browser.newtabpage.activity-stream.feeds.telemetry", false);
lockPref("browser.newtabpage.activity-stream.telemetry", false);
lockPref("datareporting.usage.uploadEnabled", false);

/** EXPERIMENTS ***/
lockPref("app.shield.optoutstudies.enabled", false);
lockPref("app.normandy.enabled", false);
lockPref("app.normandy.api_url", "");

/** CRASH REPORTS ***/
lockPref("breakpad.reportURL", "");
lockPref("browser.tabs.crashReporting.sendReport", false);

/****************************************************************************
 * SECTION: PESKYFOX                                                        *
****************************************************************************/
/** MOZILLA UI ***/
lockPref("extensions.getAddons.showPane", false);
lockPref("extensions.htmlaboutaddons.recommendations.enabled", false);
lockPref("browser.discovery.enabled", false);
lockPref("browser.shell.checkDefaultBrowser", false);
lockPref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
lockPref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
lockPref("browser.preferences.moreFromMozilla", false);
lockPref("browser.aboutConfig.showWarning", false);
lockPref("browser.startup.homepage_override.mstone", "ignore");
lockPref("browser.aboutwelcome.enabled", false);
lockPref("browser.profiles.enabled", true);

/** THEME ADJUSTMENTS ***/
lockPref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
lockPref("browser.compactmode.show", true);
lockPref("browser.privateWindowSeparation.enabled", false); // WINDOWS

/** AI ***/
lockPref("browser.ai.control.default", "blocked");
lockPref("browser.ml.enable", false);
lockPref("browser.ml.chat.enabled", false);
lockPref("browser.ml.chat.menu", false);
lockPref("browser.tabs.groups.smart.enabled", false);
lockPref("browser.ml.linkPreview.enabled", false);

/** FULLSCREEN NOTICE ***/
lockPref("full-screen-api.transition-duration.enter", "0 0");
lockPref("full-screen-api.transition-duration.leave", "0 0");
lockPref("full-screen-api.warning.timeout", 0);

/** URL BAR ***/
lockPref("browser.urlbar.trending.featureGate", false);

/** NEW TAB PAGE ***/
lockPref("browser.newtabpage.activity-stream.default.sites", "");
lockPref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
lockPref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
lockPref("browser.newtabpage.activity-stream.showSponsored", false);
lockPref("browser.newtabpage.activity-stream.showSponsoredCheckboxes", false);

/** DOWNLOADS ***/
lockPref("browser.download.manager.addToRecentDocs", false);

/** PDF ***/
lockPref("browser.download.open_pdf_attachments_inline", true);

/** TAB BEHAVIOR ***/
lockPref("browser.bookmarks.openInTabClosesMenu", false);
lockPref("browser.menu.showViewImageInfo", true);
lockPref("findbar.highlightAll", true);
lockPref("layout.word_select.eat_space_to_next_word", false);

/****************************************************************************
 * SECTION: SMOOTHFOX                                                       *
****************************************************************************/
// visit https://github.com/yokoffing/Betterfox/blob/main/Smoothfox.js
// Enter your scrolling overrides below this line:


/****************************************************************************
 * START: MY OVERRIDES                                                      *
****************************************************************************/
// visit https://github.com/yokoffing/Betterfox/wiki/Common-Overrides
// visit https://github.com/yokoffing/Betterfox/wiki/Optional-Hardening
// Enter your personal overrides below this line:

// PREF: disable login manager
lockPref("signon.rememberSignons", false);

// PREF: disable address and credit card manager
lockPref("extensions.formautofill.addresses.enabled", false);
lockPref("extensions.formautofill.creditCards.enabled", false);

// PREF: hide site shortcut thumbnails on New Tab page
lockPref("browser.newtabpage.activity-stream.feeds.topsites", false);

// PREF: hide weather on New Tab page
lockPref("browser.newtabpage.activity-stream.showWeather", false);

// PREF: hide dropdown suggestions when clicking on the address bar
lockPref("browser.urlbar.suggest.topsites", false);

// PREF: ask where to save every file
lockPref("browser.download.useDownloadDir", false);

lockPref("identity.fxaccounts.enabled", false);
lockPref("extensions.pocket.enabled", false)
lockPref("extensions.webextensions.allowPrivateBrowsingByDefault", true);

lockPref("privacy.trackingprotection.enabled", true);
lockPref("privacy.trackingprotection.socialtracking.enabled", true);

lockPref("dom.security.https_first", true)

lockPref("browser.cache.disk.enable", true);
lockPref("network.dnsCacheExpiration", 3600);
lockPref("browser.startup.page", 3);

lockPref("browser.newtabpage.enabled", false);
lockPref("browser.translations.enabled", false);

lockPref("browser.toolbars.bookmarks.visibility", "always");

lockPref("browser.urlbar.placeholderName", "");

lockPref("browser.urlbar.suggest.searches", false);
lockPref("browser.search.suggest.enabled", false);
lockPref("browser.urlbar.suggest.openpage", false);

lockPref("browser.download.start_downloads_in_tmp_dir", true);
lockPref("browser.helperApps.deleteTempFileOnExit", true);

/****************************************************************************
 * END: BETTERFOX                                                           *
****************************************************************************/
