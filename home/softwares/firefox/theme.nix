{ colors, inputs, ... }:
{
  home.file.".mozilla/firefox/default/chrome/firefox-gnome-theme".source = inputs.firefox-gnome-theme;

  # Startpage from https://gitlab.com/fazzi/startpage
  home.file.".mozilla/firefox/default/startpage" = {
    recursive = true;
    source = ./startpage;
  };

  programs.firefox.profiles.default = {
    userChrome = ''
      @import "firefox-gnome-theme/userChrome.css"
    '';
    userContent = ''
      @import "firefox-gnome-theme/userContent.css
    '';
    settings = {
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "browser.uidensity" = 1;
      "svg.context-properties.content.enabled" = true;
      # Theme options 
      "gnomeTheme.bookmarksToolbarUnderTabs" = true;
      "gnomeTheme.activeTabContrast" = true;
    };
  };

  # home.file.".mozilla/firefox/default/chrome/firefox-gnome-theme/theme/colors/dark.css".text = with colors; ''
  #   @namespace xul url("http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul");

  #   /* Variables that start with --gnome- are added by me and are assigned
  #    * to elements somewhere in this code. The rest of the variables are
  #    * built-in in Firefox, so you need to add an !important if you wanna
  #    * override them. */
  #   @media (prefers-color-scheme: dark) {	
  #   	:root {
  #   		/* Accent */
  #   		--gnome-accent-bg: var(--gnome-palette-blue-3);
  #   		--gnome-accent: #${accent};
  #   
  #   		--gnome-toolbar-star-button: var(--gnome-palette-yellow-1);
  #   
  #   		/* Window */
  #   		--gnome-window-background: #${base11};
  #   		--gnome-window-color: white;
  #   		--gnome-view-background: #${base10};
  #   		--gnome-sidebar-background: #${base00};
  #   		--gnome-secondary-sidebar-background: #${base10};
  #   
  #   		/* Card */
  #   		--gnome-card-background: rgba(255, 255, 255, 0.08);
  #   		--gnome-card-shade-color: color-mix(in srgb, black 36%, transparent);
  #   
  #   		/* Menu */
  #   		--gnome-menu-background: #${base00};
  #   
  #   		/* Header bar */
  #   		--gnome-headerbar-background: #${base10};
  #   		--gnome-headerbar-shade-color: rgba(0, 0, 0, 0.9);
  #   
  #   		/* Toolbars */
  #   		--gnome-toolbar-icon-fill: #${base07};
  #   
  #   		/* Tabs */
  #   		--gnome-tabbar-tab-hover-background: #${base02}; /* Hardcoded color */
  #   		--gnome-tabbar-tab-active-background: #${accent}; /* Hardcoded color */
  #   		--gnome-tabbar-tab-active-background-contrast: #${base00}; /* Hardcoded color */
  #   		--gnome-tabbar-tab-active-hover-background: #${accent}; /* Hardcoded color */
  #   		
  #   		--gnome-tabbar-identity-color-green: var(--gnome-palette-green-1);
  #   		--gnome-tabbar-identity-color-yellow: var(--gnome-palette-yellow-2);
  #   		--gnome-tabbar-identity-color-orange: var(--gnome-palette-orange-3);
  #   		--gnome-tabbar-identity-color-red: var(--gnome-palette-red-1);
  #   		--gnome-tabbar-identity-color-purple: var(--gnome-palette-purple-1);
  #   		
  #   		/* Text color for Firefox Logo in new private tab */
  #   		--gnome-private-wordmark: #FBFBFE;
  #   		/* New private tab background */
  #   		--gnome-private-in-content-page-background: #242424;
  #   		/* Private browsing info box */
  #   		--gnome-private-text-primary-color: #FBFBFE;
  #   	}
  #   
  #   	/* Backdrop colors */
  #   	:root:-moz-window-inactive {
  #   		--gnome-tabbar-tab-hover-background: #2c2c2c; /* Hardcoded color */
  #   		--gnome-tabbar-tab-active-background: #2e2e2e; /* Hardcoded color */
  #   	}
  #   
  #   	/* Private colors */
  #   	:root[privatebrowsingmode="temporary"] {
  #   		--gnome-accent-fg: #78aeed;
  #   		/* Headerbar */
  #   		--gnome-headerbar-background: #252F49 !important;
  #   		/* Tabs */	
  #   		--gnome-tabbar-tab-hover-background: #343e56; /* Hardcoded color */
  #   		--gnome-tabbar-tab-active-background: #343e56; /* Hardcoded color */
  #   		--gnome-tabbar-tab-active-background-contrast: #495675; /* Hardcoded color */
  #   		--gnome-tabbar-tab-active-hover-background: #414a61; /* Hardcoded color */
  #   	}
  #   
  #   	/* Private and backdrop colors */
  #   	:root[privatebrowsingmode="temporary"]:-moz-window-inactive {
  #   		--gnome-headerbar-background: #252F49 !important;
  #   		--gnome-tabbar-tab-hover-background: #242c3f; /* Hardcoded color */
  #   		--gnome-tabbar-tab-active-background: #272e41; /* Hardcoded color */
  #   	}
  #   }
  # '';
}
