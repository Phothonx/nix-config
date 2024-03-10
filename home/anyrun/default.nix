{ inputs, pkgs, theme, colors, ... }:
{
  imports = [inputs.anyrun.homeManagerModules.default];

  programs.anyrun = {
    enable = true;
    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        symbols
      ];

      width.absolute = 800;
      height.absolute = 50;
      y.fraction = 0.05 ;
      layer = "overlay";
      closeOnClick = false;
      showResultsImmediately = false;
      ignoreExclusiveZones = false;
      maxEntries = null;
      hidePluginInfo = true;
    };
    extraCss = with colors; ''
      * {
        transition: 200ms ease;
        font-family: ${theme.fonts.sansSerif};
	    font-size: ${builtins.toString theme.fonts.sizes.desktop};
      }

      #window,
      #match,
      #entry,
      #plugin,
      #main {
	    background: transparent;
      }


      #match {
      	padding: 3px;
      	border-radius: 15px;
      }

      #plugin:hover {
      	border-radius: 15px;
      }

      #entry {
        background: #${base00};
        border: 2px solid #${base0E};
        border-radius: 15px;
        margin: 0.5rem;
        padding: 0.3rem 1rem;
      }

      box#main {
	    background: #${base00};
	    border: 1px solid #${base0E};
	    border-radius: 15px;
	    padding: 8px;
      }
    '';

    extraConfigFiles = {
      "applications.ron".text = ''
        Config(
          desktop_actions: false,
          max_entries: 10,
          terminal: Some("foot"),
        )
      '';
  
      "symbols.ron".text = ''
        Config(
          prefix: "$",
          symbols: {
            // "name": "text to be copied"
            "shrug": "¯\\_(ツ)_/¯",
          },
          max_entries: 10,
        )
      '';
    };
  };
}