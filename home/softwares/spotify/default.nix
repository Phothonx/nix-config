{ pkgs, inputs, artwork, ... }:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  imports = [ inputs.spicetify-nix.homeManagerModule ];

  programs.spicetify = {
    enable = true;
    spotifyPackage = pkgs.spotify; # unstable package
    theme = artwork.spicetify.package;
    colorScheme = artwork.spicetify.colorScheme;
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      shuffle # shuffle+ (special characters are sanitized out of ext names)
      hidePodcasts
      loopyLoop
      popupLyrics
    ];
  };
}
