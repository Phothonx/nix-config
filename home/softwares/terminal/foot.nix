{ theme, colors, ... }:
{
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "${theme.fonts.monospace}:size=${builtins.toString theme.fonts.sizes.terminal}";
        box-drawings-uses-font-glyphs = "yes";
        underline-offset = "2";
        underline-thickness = "1";
        pad = "25x25center";
        selection-target = "clipboard";
        dpi-aware = "yes";
        notify = "dunstify -a \${app-id} -i \${app-id} \${title} \${body}";
      };

      cursor = {
        style = "beam";
         beam-thickness = "1.8";
      };

      colors = with colors; {
        alpha = "${builtins.toString theme.opacity.terminal}";

        foreground = base07;
        background = base00;

        regular0 = base02;
        regular1 = base08;
        regular2 = base0B;
        regular3 = base0A;
        regular4 = base0D;
        regular5 = base0E;
        regular6 = base0C;
        regular7 = "e6e6e6";

        bright0 = base04;
        bright1 = base12;
        bright2 = base14;
        bright3 = base13;
        bright4 = base15;
        bright5 = base17;
        bright6 = base14;
        bright7 = "ffffff";
      };
    };
  };
}
