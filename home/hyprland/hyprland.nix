{ pkgs, inputs, ... }:
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

        env = [
          "GDK_BACKEND,wayland,x11"
          "SDL_VIDEODRIVER,wayland"

          "XDG_CURRENT_DESKTOP,Hyprland"
          "XDG_SESSION_TYPE,wayland"
          "XDG_SESSION_DESKTOP,Hyprland"

          "QT_AUTO_SCREEN_SCALE_FACTOR,1"
          "QT_QPA_PLATFORM,wayland;xcb"
          "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
          "QT_QPA_PLATFORMTHEME,qt5ct"

          "_JAVA_AWT_WM_NONREPARENTING,1"
          "WLR_NO_HARDWARE_CURSORS,1"
          "XCURSOR_SIZE,24"
         ]; # GTK_THEME, XCURSOR_THEME

        exec-once = [
            "swayosd-server"
            "swaync"
            "swww init && swww img ./../../wallpapers/cat_leaves.png"
        ]; #  "swaylock -i ./../../wallpapers/cat_leaves.png"

        input  = {
          kb_layout = "fr";
          kb_options = "ctrl:nocaps";
          repeat_rate = 30;
          accel_profile = "flat";
          scroll_method = "2fg";

          touchpad = {
              disable_while_typing = false;
              natural_scroll = true;
              scroll_factor = 0.7;
          };
        };

      general = {
          # no_border_on_floating = false
          gaps_in = 8;
          gaps_out = 20;
          border_size = 0;
          # col.active_border = $lavender
          # col.inactive_border = $overlay0
          # col.group_border =
          # col.group_border_actve = 
          # col.group_border_locked = 
          # col.group_border_locked_active = 
      
          cursor_inactive_timeout = 10;
          # layout = dwindle
          # no_cursor_wraps = true
          # no_focus_fallback = false
          # apply_sens_to_raw = false # not reco
      
          resize_on_border = true;
          # extend_border_grab_area = 15
          hover_icon_on_border = false;
      };
      
      decoration = {
          rounding = 6;
          # multisample_edges = true
          
          # active_opacity = 1.0
          # inactive_opacity = 1.0
          # fullscreen_opacity = 1.0
      
          drop_shadow = true;
          shadow_range = 9;
          shadow_render_power = 3;
          # shadow_ignore_window = true
          #col.shadow = "0xee11111B";
          # col.shadow_inactive = 
          shadow_offset = "2 2";
          # shadow_scale = 1
          
          # dim_strenght = 0.5
          # dim_special = 0.2
          # dim_around = 0.4
      
          # screen_shader = 

          blur = {
              enabled = true;
              size = 6.8;
              passes = 2;
              ignore_opacity = false;
              # new_optimizations = true
              xray = true;
              noise = 0.015;
              contrast = 0.9;
              brightness = 0.83;
          };
      };

      dwindle = {
          pseudotile = true;
          preserve_split = true;
      };

      master = {
          new_is_master = true;
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
      
      gestures = {
          workspace_swipe = true;
          # workspace_swipe_fingers = 3
          # workspace_swipe_distance = 300
          # workspace_swipe_invert = true
          # workspace_swipe_min_speed_to_force = 30
          workspace_swipe_cancel_ratio = 0.8;
          # workspace_swipe_create_new = true
          # workspace_swipe_forever = true
          # workspace_swipe_numbered = false
          # workspace_swipe_use_r = false
      };
      
      misc = {
          # disable_hyprland_logo = false
          disable_splash_rendering = true;
          # force_hypr_chan = true
      
          # vfr = true # heavyly reco
          # vrr = 0
          # mous_move_enables_dpms = false
          key_press_enables_dpms = true;
          # always_follow_on_dnd = true
          # layer_hog_keyboard_focus = true
      
          animate_manual_resizes = true;
          animate_mouse_windowdragging = true;
      
          # disable_autoreload = false
          # enable_swallow = false
          # swallow_regex = 
          # swallow_exception_regex =
          # focus_on_activate = false
          # no_direct_scanout = true
          # moveintogroup_lock_check = false
          # hide_cursor_on_touch = true
          # mouve_move_focuses_monitor = true
          # supress_portal_warnings = false
      
          # render_ahead_of_time = false # buggy
          # render_ahead_safezone = 1
      
          # cursor_zoom_factor = 1
          # cursor_zoom_rigid = false
          # allow_session_lock_retore = false
          # group_insert_after_current = true
          # render_titles_in_groupbar = true
          # groupbar_titles_font_size = 8
          # groupbar_gradients = true
          # groupbar_text_color = 
          # background_color = 
      };
      
      binds = {
          # pass_mouse_when_bound = false
          # scroll_event_delay = 300
          # workspace_back_and_forth = false
          # focus_preferred_method = 0
      };
      
      XWayland = {
          # use_nearest_neighbor = true
          force_zero_scaling = true;
      };
      
      debug = {
          # overlay = false
          # damage_blik = false
          # disable_logs = false
          # disable_time = false
          # damage_tracking = 2
          # enable_stdout_logs = false
          # manual_crash = 0
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
      #"SUPER, mouse:273, resizewindow"
    };
 };
}