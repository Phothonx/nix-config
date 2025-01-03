{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.theme;
  hexColor = types.strMatching "([0-9a-fA-F]{3}){1,2}"; # no #
  nerdFont = fname: {
    package = pkgs.nerd-fonts.${fname};
    name = "${fname} Nerd Font";
  };
in {
  options.theme = with types; {
    enable = mkEnableOption "Enable theming cursor, icons...";

    wallpaper = mkOpt' path ./wallpapers/lavender-cat.jpg;
    lockimg = mkOpt' path ./wallpapers/cat_leaves.png;

    cursor = mkOpt' attrs {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 22;
    };

    fonts = mkOpt' attrs {
      normal = nerdFont "ubuntu";
      mono = nerdFont "jetbrains-mono";
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

    icons = mkOpt' attrs {
      name = "MoreWaita";
      package = pkgs.morewaita-icon-theme;
    };

    tweaks = mkOpt' attrs {
      gaps_in = 7;
      gaps_out = 15;
      border_size = 2;
      rounding = 10;
      scaling = 1.0;
      opacity = {
        desktop = 1.0;
        applications = 1.0;
        terminal = 1.0;
        popups = 1.0;
      };
      blur = {
        enabled = false;
        size = 4;
        passes = 1;
        noise = 0.018;
        contrast = 0.9;
        brightness = 0.83;
        vibrancy = 0.17;
      };
      shadow = {
        enabled = true;
        range = 10;
        power = 4;
        passes = 5;
        color = config.theme.palette.shadow;
        offset = "4 4";
        size = 3;
      };
    };

    palette = mkOpt' (attrsOf hexColor) rec {
      # -------- Base24 --------

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
      base0F = "eba0ac"; # maroon
      base10 = "181825"; # mantle
      base11 = "11111b"; # crust
      base12 = "f5c2e7"; # pink
      base13 = "f5e0dc"; # rosewater
      base14 = "94e2d5"; # teal
      base15 = "89dceb"; # sky
      base16 = "74c7ec"; # sapphire
      base17 = "b4befe"; # lavender

      # -------- Usage --------

      accent = base0E;
      laccent = base17;

      bg0 = base11;
      bg1 = base10;
      bg2 = base00;

      ele0 = base01;
      ele1 = base02;
      ele2 = base03;

      select = base02;
      text = base07;
      shadow = "010102"; # just black lol

      # Normal colors
      red = base08;
      orange = base09;
      yellow = base0A;
      green = base0B;
      cyan = base0C;
      blue = base0D;
      purple = base0E;
      brown = base0F;
      # Bright/light colors
      lred = base12;
      lyellow = base13;
      lgreen = base14;
      lcyan = base15;
      lblue = base16;
      lpurple = base17;
    };
  };
}
