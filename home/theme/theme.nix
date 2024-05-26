{ pkgs, ... }:
let
  font = fname: {
    package = (pkgs.nerdfonts.override { fonts = [ "${fname}" ]; });
    name = "${fname} Nerd Font";
    };
in
{
  wallpaper = ./../../wallpapers/graphism/cat_leaves.png;

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
    scaling = 1.0;
    opacity = {
      desktop = 1.0;
      applications = 1.0;
      terminal = 1.0;
      popups = 1.0;
    };
    blur = {
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
      color = "000000";
      offset = "3 3";
      size = 3;
    };
  };

  palette = {
    base00 = "1e1e2e"; # base
    base01 = "313244"; # surface 0
    base02 = "45475a"; # surface 1
    base03 = "585b70"; # surface 2
    base04 = "6c7086"; # overlay 0
    base05 = "7f849c"; # overlay 1
    base06 = "9399b2"; # overlay 2
    base07 = "cdd6f4"; # text
    base08 = "f38ba8"; # red
    base09 = "fab387"; # peach
    base0A = "f9e2af"; # yellow
    base0B = "a6e3a1"; # green
    base0C = "94e2d5"; # teal
    base0D = "89b4fa"; # blue
    base0E = "cba6f7"; # mauve
    base0F = "f5c2e7"; # pink
    base10 = "181825"; # mantle
    base11 = "11111b"; # crust
    base12 = "eba0ac"; # maroon
    base13 = "f5e0dc"; # rosewater
    base14 = "94e2d5"; # teal
    base15 = "89dceb"; # sky
    base16 = "74c7ec"; # sapphire
    base17 = "b4befe"; # lavender
    # accent = base17;
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
}
