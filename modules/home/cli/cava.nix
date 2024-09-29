{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.programs.cava;
  inherit (config) theme;
in {
  config = mkIf cfg.enable {
    programs.cava = {
      package = wrapNoPad pkgs.cava;
      settings = {
        input.method = "pipewire";
        general = {
          sensitivity = 75;
        };
        output = {
          show_idle_bar_heads = 0;
        };
        color = with theme.palette; {
          gradient = 1;
          gradient_color_1 = "'#${base0C}'";
          gradient_color_2 = "'#${base15}'";
          gradient_color_3 = "'#${base16}'";
          gradient_color_4 = "'#${base0D}'";
          gradient_color_5 = "'#${base0E}'";
          gradient_color_6 = "'#${base0F}'";
          gradient_color_7 = "'#${base12}'";
          gradient_color_8 = "'#${base08}'";
        };
      };
    };
  };
}
