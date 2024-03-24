{ colors, ... }:
{
  programs.cava = {
    enable = true;
    settings = {
      input.method = "pipewire";
      color = with colors; {
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
}
