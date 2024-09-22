{ config, lib, ... }:
with lib;
let
  cfg = config.programs.tofi;
  inherit (config) theme;
in
{
  config = mkIf cfg.enable {
    programs.tofi.settings = {
      font = theme.fonts.mono.name;

	    # Point size of text.
    	font-size = 26;

      #
      ### Text theming
      #
      	text-color = "#cdd6f4";
      	# Prompt text theme
      	prompt-color = "#f38ba8";
      	# Selection text
      	selection-color = "#f9e2af";

      #
      ### Text layout
      #
      	# Maximum number of results to display.
      	# If 0, tofi will draw as many results as it can fit in the window.
      	num-results = 7;
      	# Spacing between results in pixels. Can be negative.
      	result-spacing = 20;
      
      #
      ### Window theming
      #
      	# Width and height of the window. Can be pixels or a percentage.
      	width = "100%";
      	height = "100%";
      	# Window background color
      	background-color = "#000A";
      	# Width of the border outlines in pixels.
      	outline-width = 0;
      	# Width of the border in pixels.
      	border-width = 0;
      	# Padding between borders and text. Can be pixels or a percentage.
      	padding-top = "35%";
      	padding-left = "35%";

      #
      ### Behaviour
      #
      	# Hide the mouse cursor.
      	hide-cursor = true;
      	# Sort results by number of usages in run and drun modes.
      	history = true;
      	# Select the matching algorithm used. If normal, substring matching is
      	fuzzy-match = true;
      	# If true, directly launch applications on selection when in drun mode.
      	# Otherwise, just print the command line to stdout.
      	drun-launch = true;
    };
  };
}
