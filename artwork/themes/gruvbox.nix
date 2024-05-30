{ pkgs, inputs, ... }:
let
  font = fname: {
    package = (pkgs.nerdfonts.override { fonts = [ "${fname}" ]; });
    name = "${fname} Nerd Font";
    };

  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
rec {
  wallpaper = ./../wallpapers/slow-rush.jpg;

  cursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 22;
  };

  fonts = {
    serif = font "Ubuntu";
    sansSerif = font "Ubuntu";
    monospace = font "JetBrainsMono";
    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
    sizes = {
      desktop = 22;
      applications = 12;
      terminal = 9;
    };
  };

  icons = { 
    name = "MoreWaita";
    package = pkgs.morewaita-icon-theme;
  };

  tweaks = {
    gaps_in = 5;
    gaps_out = 20;
    border_size = 2;
    rounding = 14;
    scaling = 1.0;
    opacity = {
      desktop = 1.0;
      applications = 1.0;
      terminal = 1.0;
      popups = 1.0;
    };
    blur = {
      enabled = true;
      size = 3;
      passes = 3;
      noise = 0.018;
      contrast = 0.9;
      brightness = 0.83;
    };
    shadow = {
      enabled = true;
      range = 15;
      power = 4;
      passes = 4;
      color = palette.base10;
      offset = "3 3";
      size = 3;
    };
  };

  palette = rec {
    base00 = "282828"; # bg0
    base01 = "3c3836"; # bg1
    base02 = "504945"; # bg2
    base03 = "665c54"; # bg3
    base04 = "7c6f64"; # bg4
    base05 = "bdae93"; # fg3
    base06 = "ebdbb2"; # fg1
    base07 = "fbf1c7"; # fg0
    base08 = "cc241d"; # red
    base09 = "d65d0e"; # orange
    base0A = "d79921"; # yellow
    base0B = "98971a"; # green
    base0C = "689d6a"; # aqua
    base0D = "458588"; # blue
    base0E = "b16286"; # purple
    base0F = "9d0006"; # # red light mode
    base10 = "1d2021"; # bg0_h
    base11 = "1d2021"; # bg0_h
    base12 = "fb4934"; # bred
    base13 = "fabd2f"; # byellow
    base14 = "b8bb26"; # bgreen
    base15 = "8ec07c"; # baqua
    base16 = "83a598"; # bblue
    base17 = "d3869b"; # bpurple
    accent = base0B;
  };

  qt = {
    name ="Catppuccin-Mocha";
    package = pkgs.catppuccin-qt5ct;
  };

  gtk = {
    name = "Catppuccin-Mocha-Compact-Mauve-Dark";
    package = pkgs.catppuccin-gtk.override {
      accents = [ "mauve" ];
      size = "compact"; # "standard" "compact"
      #tweaks = [ "rimless" ]; # "black" "rimless" "normal" 
      variant = "mocha";
    };
  };

  spicetify = {
    package = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
}
