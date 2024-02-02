{ pkgs, inputs, colors, ... }:
let
  bindings = import ./binds.nix;
  rules = import ./rules.nix;
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
          "eDP-1, 1920x1200@60, 0x0, 1" # personal monitor
        ];

        exec-once = [
          "waybar"
          "hyprctl setcursor Bibata-Modern-Ice 22"
          "swayosd-server"
          "swaync"
          "swww init && swww img ./../../wallpapers/cat_leaves.png" # wallpaper setup
        ]; #  "swaylock -i ./../../wallpapers/cat_leaves.png"

      general = {
          # no_border_on_floating = false
          gaps_in = 5;
          gaps_out = 20;
          border_size = 2;

          gaps_workspaces = 5;

          # string to set attribute "col.inactive_border" and not .inactive_border from subset col
          "col.inactive_border" = "rgb(${colors.base02})";
          "col.active_border" = "rgb(${colors.base0E})";
      
          cursor_inactive_timeout = 20;
          layout = "dwindle";
      
          resize_on_border = true; # resize windows
          hover_icon_on_border = false;
      };
      
      decoration = {
          rounding = 15;
          
          # active_opacity = 1.0
          # inactive_opacity = 1.0
          # fullscreen_opacity = 1.0
      
          drop_shadow = true; # lil shadow <3
          shadow_range = 12;
          shadow_render_power = 3;
          "col.shadow" = "0xee11111B";
          shadow_offset = "2 2";

          blur = { # this blurr <3
              enabled = true;
              size = 1;
              passes = 3;
              # xray = true;
              noise = 0.020;
              contrast = 0.9;
              brightness = 0.83;
              # special = true; # nice but less smooth
              popups = true;
          };
      };

      dwindle = {
          pseudotile = true;
          preserve_split = true;
          smart_split = true; # choose split direction with cursor position on window
          special_scale_factor = 0.9; # forgot whit it is lol
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
        kb_options = "ctrl:nocaps"; # disable capslock
        repeat_rate = 50; # on long press
        repeat_delay = 400; # time to hold before repeating
        sensitivity = 0.2;
        accel_profile = "flat"; # no mouse acceleration
        scroll_method = "2fg"; # 2 finger scroll
        follow_mouse = 1; # window focus under mouse
        float_switch_override_focus = 2; # same but with floating windows
        touchpad = {
            disable_while_typing = false;
            natural_scroll = true; # invert
            scroll_factor = 0.8;
        };
      };

      gestures = {
          workspace_swipe = true; # 3 fingers
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
          force_zero_scaling = true; # solve piexlated windows
      };
      
      inherit bindings rules;
    };
 };

}