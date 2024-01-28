{ config, pkgs, inputs, ... }:
let
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
          # col.inactive_border = "${colors.base02}";
          # col.active_border = "${colors.base06}";
      
          cursor_inactive_timeout = 10;
          layout = "dwindle";
      
          resize_on_border = true;
          hover_icon_on_border = false;
      };
      
      decoration = {
          rounding = 6;
          
          # active_opacity = 1.0
          # inactive_opacity = 1.0
          # fullscreen_opacity = 1.0
      
          drop_shadow = true;
          shadow_range = 11;
          shadow_render_power = 3;
          # shadow_ignore_window = true
          # col.shadow = "0xee11111B";
          shadow_offset = "2 2";
          # shadow_scale = 1
          
          # screen_shader = 

          blur = {
              enabled = true;
              size = 6.8;
              passes = 2;
              xray = true;
              noise = 0.015;
              contrast = 0.9;
              brightness = 0.83;
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
      
      bind = [
        "SUPER, Q, exec, kitty"
        "SUPER, H, exec, firefox"
        "CTRL ALT, L, exec, swaylock --daemonize --screenshots --effect-blur=8x7"

        "SUPER, P, pseudo,"
        "SUPER SHIFT, P, workspaceopt, allpseudo"
        "SUPER SHIFT, P, exec, notify-send 'Toggled All Pseudo Mode'"
        "SUPER, Space, togglefloating,"
        "SUPER SHIFT, Space, workspaceopt, allfloat"
        "SUPER SHIFT, Space, exec, notify-send 'Toggled All Float Mode'"
        "SUPER, J, togglesplit,"
        "SUPER, F, fullscreen,"

        "SUPER, C, killactive," 
        "SUPER_SHIFT, M, exit,"
        "SUPER, M, exec, hyprctl reload"

        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"
        "SUPER, Tab, cyclenext,"
        "SUPER, Tab, bringactivetotop,"

        "SUPER, code:10, workspace, 1"
        "SUPER, code:11, workspace, 2"
        "SUPER, code:12, workspace, 3"
        "SUPER, code:13, workspace, 4"
        "SUPER, code:14, workspace, 5"
        "SUPER, code:15, workspace, 6"
        "SUPER, code:16, workspace, 7"
        "SUPER, code:17, workspace, 8"
        "SUPER, code:18, workspace, 9"
        "SUPER, code:19, workspace, 10"

        "SUPER SHIFT, code:10, movetoworkspacesilent, 1"
        "SUPER SHIFT, code:11, movetoworkspacesilent, 2"
        "SUPER SHIFT, code:12, movetoworkspacesilent, 3"
        "SUPER SHIFT, code:13, movetoworkspacesilent, 4"
        "SUPER SHIFT, code:14, movetoworkspacesilent, 5"
        "SUPER SHIFT, code:15, movetoworkspacesilent, 6"
        "SUPER SHIFT, code:16, movetoworkspacesilent, 7"
        "SUPER SHIFT, code:17, movetoworkspacesilent, 8"
        "SUPER SHIFT, code:18, movetoworkspacesilent, 9"
        "SUPER SHIFT, code:19, movetoworkspacesilent, 10"

        "SUPER CTRL, right, workspace, r+1"
        "SUPER CTRL, left, workspace, r-1"
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"

        "SUPER, mouse:272, movewindow"

        "SUPER, A, togglespecialworkspace"
        "SUPER SHIFT, A, movetoworkspace, special"
      ];
    };
 };

}