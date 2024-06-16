{ pkgs, inputs, colors, artwork, ... }:
{
  imports = [ inputs.anyrun.homeManagerModules.default ];

  programs.anyrun = {
    enable = true;
    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
      ];

      width.fraction = 0.3;
      y.fraction = 0.5 ;
      x.fraction = 0.5 ;
      layer = "overlay";
      closeOnClick = true;
      showResultsImmediately = true;
      ignoreExclusiveZones = false;
      maxEntries = null;
      hidePluginInfo = true;
    };
    extraCss = with colors; ''
      * {
        transition: 200ms ease;
        font-family: ${artwork.fonts.normal.name};
	      font-size: ${builtins.toString artwork.fonts.sizes.desktop};
      }

      #window,
      #match,
      #entry,
      #plugin,
      #main {
        background: transparent;
      }

      #match.activatable {
        border-radius: 16px;
        padding: 0.3rem 0.9rem;
        margin-top: 0.01rem;
      }
      #match.activatable:first-child {
        margin-top: 0.7rem;
      }
      #match.activatable:last-child {
        margin-bottom: 0.6rem;
      }

      #plugin:hover #match.activatable {
        border-radius: 10px;
        padding: 0.3rem;
        margin-top: 0.01rem;
        margin-bottom: 0;
      }

      #match:selected,
      #match:hover,
      #plugin:hover {
        background: rgba(255, 255, 255, 0.1);
      }

      #entry {
        background: solid #${base10};
        border: 2px solid #${base0E};
        border-radius: 14px;
        margin: 0.5rem;
        padding: 0.3rem 1rem;
      }

      list > #plugin {
        border-radius: 16px;
        margin: 0 0.3rem;
      }
      list > #plugin:first-child {
        margin-top: 0.3rem;
      }
      list > #plugin:last-child {
        margin-bottom: 0.3rem;
      }
      list > #plugin:hover {
        padding: 0.6rem;
      }

      box#main {
        background: rgba(0, 0, 0, 0);
      }
    '';

    extraConfigFiles = {
      "applications.ron".text = ''
        Config(
          desktop_actions: false,
          max_entries: 10,
          terminal: Some("kitty"),
        )
    '';
    };
  };
}
