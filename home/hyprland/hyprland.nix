{ config, pkgs, inputs, ... }:
let
  bindings = import ./binds.nix;
  rules = import ./rules.nix;
  colors = config.colorScheme.colors;
in
{
  wayland.windowManager.hyprland = {
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;

    settings = {
        "$MOD" = "SUPER";
        monitor = [
          "eDP-1, 1920x1200@60, 0x0, 1"
        ];

        exec-once = [
          "hyprctl setcursor Bibata-Modern-Ice 22"
            "swayosd-server"
            "swaync"
            "swww init && swww img ./../../wallpapers/cat_leaves.png"
        ]; #  "swaylock -i ./../../wallpapers/cat_leaves.png"

      general = {
          # no_border_on_floating = false
          gaps_in = 5;
          gaps_out = 15;
          border_size = 2;
          # gaps_workspaces = 0;

          # string to set attribute "col.inactive_border" and not .inactive_border from subset col
          "col.inactive_border" = "0xf${colors.base04}";
          "col.active_border" = "0xf${colors.base0D}";
      
          cursor_inactive_timeout = 10;
          layout = "dwindle";
      
          resize_on_border = true;
          hover_icon_on_border = false;
      };
      
      decoration = {
          rounding = 15;
          
          # active_opacity = 1.0
          # inactive_opacity = 1.0
          # fullscreen_opacity = 1.0
      
          drop_shadow = true;
          shadow_range = 15;
          # shadow_render_power = 3;
          "col.shadow" = "0xffa7caff";
          "col.shadow_inactive" = "0x50000000";
          # shadow_offset = "2 2";
          # shadow_scale = 1
          
          # screen_shader = 

          blur = {
              enabled = true;
              size = 6.8;
              passes = 2;
            #  xray = true;
            #  noise = 0.015;
            #  contrast = 0.9;
            #  brightness = 0.83;
          };
      };

      dwindle = {
          pseudotile = true;
          preserve_split = true;
          smart_split = true;
          special_scale_factor = 0.9;
      };

      animations = {
          enabled = true;
          bezier = [
            "myBezier, 0.05, 0.9, 0.1, 1.05"
            "overshot,0.05,0.9,0.1,1.1"
          ];
          animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 70%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
          ];
      };

      input  = {
        kb_layout = "fr";
        kb_options = "ctrl:nocaps";
        repeat_rate = 35;
        sensitivity = 0.2;
        accel_profile = "flat";
        scroll_method = "2fg";
        follow_mouse = 1;
        float_switch_override_focus = 2;
        touchpad = {
            disable_while_typing = false;
            natural_scroll = true;
            scroll_factor = 0.8;
        };
      };

      gestures = {
          workspace_swipe = true;
          workspace_swipe_distance = 250;
          workspace_swipe_cancel_ratio = 0.7;
      };
      
      misc = {
          animate_manual_resizes = true;
          animate_mouse_windowdragging = true;
          hide_cursor_on_touch = false;
          # background_color = 
      };
      
      binds = {};
      
      XWayland = {
          force_zero_scaling = true;
      };
      
      inherit bindings rules;
    };
 };

}