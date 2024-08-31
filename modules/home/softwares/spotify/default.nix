{ config, lib, pkgs, inputs, ... }:
with lib;
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  cfg = config.programs.spicetify;
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  config = mkIf cfg.enable {
    programs.spicetify = {
      theme = spicePkgs.themes.starryNight;
      colorScheme = "base";
      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplay
        shuffle # shuffle+ (special characters are sanitized out of ext names)
        hidePodcasts
        loopyLoop
        popupLyrics
        keyboardShortcut
        addToQueueTop
        showQueueDuration
        volumePercentage
      ];
    };
  };
}
