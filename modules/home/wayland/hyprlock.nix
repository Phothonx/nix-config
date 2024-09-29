{ config, lib, ... }:
with lib;
let
  cfg = config.programs.hyprlock;
  inherit (config) theme;
in
{
  config = mkIf cfg.enable {
    programs.hyprlock = {
      settings = {
        general = {
          hide_cursor = true;
          disable_loading_bar = true;
          ignore_empty_input = true;

          no_fade_in = true;
          immediate_render = true;
        };

        background = [
          {
            monitor = "";
            path = "${theme.lockimg}";
          }
        ];

        input-field = with theme.palette; [
          {
            monitor = "";
            size = "250, 50";
            outline_thickness = 2;
            dots_size = 0.25;
            dots_spacing = 0.5;
            dots_center = true;
            dots_rounding = -1;
            outer_color = "rgb(${base0E})";
            inner_color = "rgb(${base00})";
            font_color = "rgb(${base07})";
            check_color = "rgb(${base0A})";
            fail_color = "rgb(${base08})";
            fail_text = "<i><span foreground=\"##${base08}\">$FAIL ($ATTEMPTS)</span></i>";
            fail_transition = 300;
            fade_on_empty = true;
            fade_timeout = 3000;
            placeholder_text = "<i>Password...</i>";
            rounding = 15;
            position = "0, 60";
            halign = "center";
            valign = "bottom";
            shadow_passes = 2;
            shadow_size = 4;
            shadow_color = "rgb(${base10})";
          }
        ];

        label = with theme.palette; [
          {
            monitor = "";
            text = "cmd[update:1000] echo \"<b><big> $(date +\"%H\") </big></b>\"";
            color = "rgb(${base07})";
            font_size = 120;
            font_family = theme.fonts.normal.name;
            position = "0, 100";
            halign = "center";
            valign = "center";
            shadow_passes = 2;
            shadow_size = 4;
            shadow_color = "rgb(${base10})";
          }
          {
            monitor = "";
            text = "cmd[update:1000] echo \"<b><big> $(date +\"%M\") </big></b>\"";
            color = "rgb(${base07})";
            font_size = 120;
            font_family = theme.fonts.normal.name;
            position = "0, -50";
            halign = "center";
            valign = "center";
            shadow_passes = 2;
            shadow_size = 4;
            shadow_color = "rgb(${base10})";
          }
          {
            monitor = "";
            text = "cmd[update:1000] echo \"<b><big> $(date +\"%d %b\") </big></b>\"";
            color = "rgb(${base03})";
            font_size = 16;
            font_family = theme.fonts.normal.name;
            position = "0, -160";
            halign = "center";
            valign = "center";
            shadow_passes = 2;
            shadow_size = 4;
            shadow_color = "rgb(${base10})";
          }
          {
            monitor = "";
            text = "cmd[update:1000] echo \"<b><big> $(date +\"%A\") </big></b>\"";
            color = "rgb(${base03})";
            font_size = 16;
            font_family = theme.fonts.normal.name;
            position = "0, -180";
            halign = "center";
            valign = "center";
            shadow_passes = 2;
            shadow_size = 4;
            shadow_color = "rgb(${base10})";         
          }
        ];
      };
    };
  };
}
